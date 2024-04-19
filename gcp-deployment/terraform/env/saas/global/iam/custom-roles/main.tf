# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


/******************************************
  Remote state for Project
 *****************************************/

data "terraform_remote_state" "service_project_id" {
  backend = "gcs"
  config = {
    bucket = var.project_state_bucket
    prefix = var.service_project_prefix_path
  }
}


data "terraform_remote_state" "host_project_id" {
  backend = "gcs"
  config = {
    bucket = var.project_state_bucket
    prefix = var.host_project_prefix_path
  }
}


module "custom_roles" {
  source      = "../../../../modules/terraform-google-custom-roles"
  project     = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]
  for_each    = var.custom_roles
  role_id     = each.value.role_id
  permissions = each.value.permissions
}
module "host_custom_roles" {
  source      = "../../../../modules/terraform-google-custom-roles"
  project     = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  for_each    = var.host_custom_roles
  role_id     = each.value.role_id
  permissions = each.value.permissions
}