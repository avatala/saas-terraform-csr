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

/******************************************
Service Account Details
*****************************************/

module "service_accounts" {
  source       = "../../../../modules/terraform-google-service-accounts"
  project_id   = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]
  for_each     = var.service_accounts
  prefix       = each.value.prefix
  names        = each.value.names
  display_name = each.value.display_name
  description  = each.value.description
}

module "anthos_hub_service_accounts" {
  source       = "../../../../modules/terraform-google-service-accounts"
  project_id   = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  for_each     = var.anthos_hub_service_accounts
  prefix       = each.value.prefix
  names        = each.value.names
  display_name = each.value.display_name
  description  = each.value.description
}

module "host_service_accounts" {
  source       = "../../../../modules/terraform-google-service-accounts"
  project_id   = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  for_each     = var.host_service_accounts
  prefix       = each.value.prefix
  names        = each.value.names
  display_name = each.value.display_name
  description  = each.value.description
}
