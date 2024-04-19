# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# ----------------------------------------------------------------
# Module for  tf Service API
# -----------------------------------------------------------------
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

module "admin-host-project-services" {
  source                     = "../../../modules/service-api"
  for_each                   = var.admin-host-project-services
  disable_dependent_services = each.value.disable_dependent_services
  project_id                 = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  activate_apis              = each.value.activate_apis
}

module "freemium-project-services" {
  source                     = "../../../modules/service-api"
  for_each                   = var.anthos-hub-project-services
  disable_dependent_services = each.value.disable_dependent_services
  project_id                 = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]
  activate_apis              = each.value.activate_apis
}

module "anthos-hub-project-services" {
  source                     = "../../../modules/service-api"
  for_each                   = var.anthos-hub-project-services
  disable_dependent_services = each.value.disable_dependent_services
  project_id                 = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  activate_apis              = each.value.activate_apis
}


