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
    CLOUD_BUILD_PROJECT_ID = var.seed_project_id
    FREEMIUM_CLOUD_BUILD_TRIGGER_ID = "FREEMIUM__TRIGGER__ID"
    FREEMIUM_CLOUD_BUILD_PROJECT_LOCATION = "FREEMIUM__TRIGGER__LOCATION"
    FREEMIUM_CLOUD_BUILD_REPO_NAME = "APP_REPO_NAME_"
    FREEMIUM_CLOUD_BUILD_BRANCH_NAME = "REPO_BRANCH_NAME"
    ENTERPRISE_CLOUD_BUILD_TRIGGER_ID = "ENTERPRISE__TRIGGER__ID"
    ENTERPRISE_CLOUD_BUILD_PROJECT_LOCATION = "ENTERPRISE__TRIGGER__LOCATION"
    ENTERPRISE_CLOUD_BUILD_REPO_NAME = "CODE_REPOSITORY_NAME"
    ENTERPRISE_CLOUD_BUILD_BRANCH_NAME = "REPO_BRANCH_NAME"
  }
  ingress_settings              = var.ingress_settings
  service_account_email         = var.service_account_email
}

# /******************************************
# 	Resource for Cloud run IAM member
#  *****************************************/

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers"
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = var.region
  project     = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  service     = var.function_name

  policy_data = data.google_iam_policy.noauth.policy_data
  depends_on = [
    module.cloud_function
  ]
}