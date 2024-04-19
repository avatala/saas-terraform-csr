# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.host_project_prefix_path
 }
}

# ------------------------------------------------------------------------------
# Module for Cloud Function
# ------------------------------------------------------------------------------

module "cloud_function" {
  source                        = "../../../modules/cloud-function"
  project_id                    = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  function_name                 = var.function_name
  function_region               = var.region
  function_description          = var.function_description
  runtime                       = var.runtime
  entrypoint                    = var.entrypoint
  bucket_name                   = var.bucket_name
  object_name                   = var.object_name
  max_instance_count            = var.max_instance_count
  min_instance_count            = var.min_instance_count
  function_memory               = var.function_memory
  function_timeout              = var.function_timeout
  available_cpu                 = var.available_cpu
  authentication                = var.authentication
  role                          = var.role
  environment_variables = {
    PROJECT_ID             = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
    ADMIN_PORTAL_DOMAIN    = "admin-saas.PREFIX_NAME.ADMIN_DOMAIN_"
  }
  ingress_settings              = var.ingress_settings
  service_account_email         = var.service_account_email
}