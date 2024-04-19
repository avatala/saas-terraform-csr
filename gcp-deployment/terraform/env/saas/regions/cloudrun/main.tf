# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
	Cloud Run Details
 *****************************************/


data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.host_project_prefix_path
 }
}

module "cloudrun_apps" {
  source                        = "../../../modules/cloudrun"
  project_id                    = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  for_each                      = var.cloudrun_apps
  region_name                   = each.value.region_name
  cloudrun_service_config       = each.value.cloudrun_service_config
  container_port                = each.value.container_port
  ingress_type                  = each.value.ingress_type
  member                        = each.value.member
}