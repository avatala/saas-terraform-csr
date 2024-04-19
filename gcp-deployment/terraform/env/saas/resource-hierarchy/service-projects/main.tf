# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Remote state for Host project
 *****************************************/

data "terraform_remote_state" "host_project_id" {
  backend = "gcs"
  config = {
    bucket = var.project_state_bucket
    prefix = var.host_project_prefix_path
  }
}


module "service_projects" {
  source                         = "../../../modules/terraform-google-project-factory/svpc_service_project/"
  for_each                       = var.service_projects
  name                           = each.value.project_name
  random_project_id              = false
  folder_id                      = each.value.folder_id
  billing_account                = each.value.billing_account
  default_network_tier           = var.default_network_tier
  create_project_sa              = true
  activate_apis                  = each.value.activate_apis
  shared_vpc                     = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  default_logging_retention_days = each.value.default_logging_retention_days
  grant_services_network_role    = each.value.grant_services_network_role
  labels                         = each.value.labels
}
