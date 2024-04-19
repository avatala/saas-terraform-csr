# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Project IAM Binding Details
 *****************************************/

data "terraform_remote_state" "host_project_id" {
  backend = "gcs"
  config = {
    bucket = var.project_state_bucket
    prefix = var.host_project_prefix_path
  }
}
data "terraform_remote_state" "service_project_id" {
  backend = "gcs"
  config = {
    bucket = var.project_state_bucket
    prefix = var.service_project_prefix_path
  }
}

locals {
  anthos = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  freemium = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]

}

module "service_member_iam_bindings_01" {
  source   = "../../../../../modules/terraform-google-iam/member_iam/"
  for_each = var.service_member_iam_bindings_01
  service_account_address = each.value.service_account_address
  project_id = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  project_roles  = each.value.role_name
}

module "service_member_iam_bindings_02" {
  source   = "../../../../../modules/terraform-google-iam/member_iam/"
  for_each = var.service_member_iam_bindings_02
  service_account_address = each.value.service_account_address
  project_id = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]
  project_roles  = each.value.role_name
}


module "host_member_iam_bindings_01" {
  source   = "../../../../../modules/terraform-google-iam/member_iam/"
  for_each = var.host_member_iam_bindings_01
  service_account_address = each.value.service_account_address
  project_id = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  project_roles  = each.value.role_name
}

module "gke_iam_bindings_01" {
  source   = "../../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "service-${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_number"]}@container-engine-robot.iam.gserviceaccount.com"
  project_id = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  project_roles  = ["roles/compute.networkAdmin", "roles/compute.admin", "roles/container.hostServiceAgentUser", "roles/iam.securityAdmin" ]
}

module "seed_member_iam_bindings_01" {
  source   = "../../../../../modules/terraform-google-iam/member_iam/"
  for_each = var.seed_member_iam_bindings_01
  service_account_address = each.value.service_account_address
  project_id =  each.value.project_id
  project_roles  = each.value.role_name
}

module "user_iam_bindings" {
  source   = "../../../../../modules/terraform-google-iam/projects_iam/"
  projects = [data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]]
  mode     = "additive"
  bindings = {
    "roles/firebase.admin" = var.users,
    "roles/monitoring.viewer" = var.users,
    "roles/editor" = var.users
  }
}

module "iap_iam_bindings" {
  source   = "../../../../../modules/terraform-google-iam/projects_iam/"
  projects = [data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]]
  mode     = "additive"
  bindings = {
    "roles/iap.admin" = var.users
  }
}

module "user_logging_iam_bindings" {
  source   = "../../../../../modules/terraform-google-iam/projects_iam/"
  projects = [data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]]
  mode     = "additive"
  bindings = {
    "roles/logging.viewer" = var.users
  }
}

module "user_anthos_hub_iam_bindings" {
  source   = "../../../../../modules/terraform-google-iam/projects_iam/"
  projects = [data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]]
  mode     = "additive"
  bindings = {
    "roles/gkehub.viewer" = var.users
  }
}

// added project to matric scope
resource "google_monitoring_monitored_project" "primary" {
  metrics_scope = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  name          = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]
  depends_on = [
    module.service_member_iam_bindings_01,module.service_member_iam_bindings_02
  ]
}