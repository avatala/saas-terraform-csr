# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
module "hub_registration" {
  source             = "../../../modules/hub_registration"
  region             = var.region
  cluster_project_id = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]
  hub_project_id     = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  cluster_name       = data.terraform_remote_state.gke_cluster.outputs.main_vpc_gke_private_clusters.main_vpc_gke_private_cluster_01.name
  depends_on = [
    module.svc_mesh_iam_bindings_01
  ]
}

module "svc_gke_hub_iam_bindings_01" {
  source   = "../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "service-${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_number"]}@gcp-sa-gkehub.iam.gserviceaccount.com"
  project_id = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]
  project_roles  = ["roles/container.admin"]
  depends_on = [
    null_resource.transfer_sa_bind
  ]
}

module "svc_mesh_iam_bindings_01" {
  source   = "../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "service-${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_number"]}@gcp-sa-servicemesh.iam.gserviceaccount.com"
  project_id = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]
  project_roles  = ["roles/anthosservicemesh.serviceAgent"]
  depends_on = [
    module.svc_gke_hub_iam_bindings_01
  ]
}

locals {
  gke_hub_sa="gcloud beta services identity create --service=gkehub.googleapis.com --project=${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]}"
  gke_hub_bind="gcloud projects add-iam-policy-binding ${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]} --member=serviceAccount:service-${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_number"]}@gcp-sa-gkehub.iam.gserviceaccount.com --role=roles/gkehub.serviceAgent"

  mesh_sa="gcloud beta services identity create --service=meshconfig.googleapis.com --project=${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]}"
  mesh_sa_bind="gcloud projects add-iam-policy-binding ${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]} --member=serviceAccount:service-${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_number"]}@gcp-sa-servicemesh.iam.gserviceaccount.com --role=roles/anthosservicemesh.serviceAgent"

  transfer_sa="gcloud beta services identity create --service=bigquerydatatransfer.googleapis.com --project=${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]}"
  transfer_sa_bind="gcloud projects add-iam-policy-binding ${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]} --member=serviceAccount:service-${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_number"]}@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com --role=roles/bigquerydatatransfer.serviceAgent"
}

resource "null_resource" "gke_hub_sa" {
  triggers = merge({
    gke_hub_sa = local.gke_hub_sa
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.gke_hub_sa
  }
}

resource "null_resource" "gke_hub_bind" {
  triggers = merge({
    gke_hub_bind = local.gke_hub_bind
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.gke_hub_bind
  }
  depends_on = [
    null_resource.gke_hub_sa
  ]
}


resource "null_resource" "mesh_sa" {
  triggers = merge({
    mesh_sa = local.mesh_sa
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.mesh_sa
  }
  depends_on = [
    null_resource.gke_hub_bind
  ]
}

resource "null_resource" "mesh_sa_bind" {
  triggers = merge({
    mesh_sa_bind = local.mesh_sa_bind
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.mesh_sa_bind
  }
  depends_on = [
    null_resource.mesh_sa
  ]
}

resource "null_resource" "transfer_sa" {
  triggers = merge({
    transfer_sa = local.transfer_sa
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.transfer_sa
  }
  depends_on = [
    null_resource.mesh_sa_bind
  ]
}

resource "null_resource" "transfer_sa_bind" {
  triggers = merge({
    transfer_sa_bind = local.transfer_sa_bind
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.transfer_sa_bind
  }
  depends_on = [
    null_resource.transfer_sa
  ]
}