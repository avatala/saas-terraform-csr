# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
/******************************************
	module website for serverless neg
 *****************************************/
module "admin-portal" {
  source                 = "../../../../modules/terraform-google-serverless-neg"
  name                   = var.name
  project                = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  region                 = var.region
  cloud_run_service_name = data.terraform_remote_state.cloud_run.outputs.cloudrun_apps.cloudrun_app_01["service_name"]
}

module "master_cf" {
  source                 = "../../../../modules/terraform-google-serverless-neg"
  name                   = var.master_cf
  project                = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  region                 = var.region
  cloud_run_service_name = var.master_cf_cloud_run_service_name
}

module "email_verification" {
  source                 = "../../../../modules/terraform-google-serverless-neg"
  name                   = var.email_verification
  project                = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  region                 = var.region
  cloud_run_service_name = var.email_verification_cloud_run_service_name
}

module "gcip" {
  source                 = "../../../../modules/terraform-google-serverless-neg"
  name                   = var.gcip
  project                = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  region                 = var.region
  cloud_run_service_name = data.terraform_remote_state.gcip.outputs.gcip_name
}