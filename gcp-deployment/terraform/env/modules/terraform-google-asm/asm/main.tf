# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

locals {
  // GKE release channel is a list with max length 1 https://github.com/hashicorp/terraform-provider-google/blob/9d5f69f9f0f74f1a8245f1a52dd6cffb572bbce4/google/resource_container_cluster.go#L954
  gke_release_channel          = data.google_container_cluster.asm.release_channel != null ? data.google_container_cluster.asm.release_channel[0].channel : ""
  gke_release_channel_filtered = lower(local.gke_release_channel) == "unspecified" ? "" : local.gke_release_channel
  // In order or precedence, use (1) user specified channel, (2) GKE release channel, and (3) regular channel
  channel       = lower(coalesce(var.channel, local.gke_release_channel_filtered, "regular"))
  revision_name = "asm-managed-stable"
  // Fleet ID should default to project ID if unset
  fleet_id = coalesce(var.fleet_id, var.project_id)
}

resource "google_gke_hub_feature" "mesh" {
  count    = var.enable_mesh_feature ? 1 : 0
  name     = "servicemesh"
  project  = local.fleet_id
  location = "global"
  provider = google-beta
}

data "google_container_cluster" "asm" {
  project  = var.cluster_project_id
  name     = var.cluster_name
  location = var.cluster_location

  depends_on = [var.module_depends_on]
}

resource "kubernetes_namespace" "system" {
  count = var.create_system_namespace ? 1 : 0

  metadata {
    name = "istio-system"
  }
  depends_on = [google_gke_hub_feature.mesh]
}

resource "kubernetes_config_map" "asm_options" {
  metadata {
    name      = "asm-options"
    namespace = try(kubernetes_namespace.system[0].metadata[0].name, "istio-system")
  }

  data = {
    multicluster_mode = var.multicluster_mode
    ASM_OPTS          = var.enable_cni ? "CNI=on" : null
  }

  depends_on = [var.module_depends_on,google_gke_hub_feature.mesh]
}

module "cpr" {
  source  = "terraform-google-modules/gcloud/google//modules/kubectl-wrapper"
  version = "~> 3.1"

  project_id       = var.cluster_project_id
  cluster_name     = var.cluster_name
  cluster_location = var.cluster_location
  internal_ip      = var.internal_ip

  kubectl_create_command  = "${path.module}/scripts/create_cpr.sh ${local.revision_name} ${local.channel} ${var.enable_cni} ${var.enable_vpc_sc}"
  kubectl_destroy_command = "${path.module}/scripts/destroy_cpr.sh ${local.revision_name}"

}
