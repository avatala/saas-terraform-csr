# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


/******************************************
	Module for Cloud Function
 *****************************************/

module "cloud_function" {
  source                        = "../../../modules/cloud-function-gen1"
  for_each                      = var.cloud_functions
  trigger_http                  = each.value.trigger_http
  labels                        = each.value.labels
  name                          = each.value.cloud_function_name
  project_id                    = each.value.project_id
  region                        = each.value.region
  runtime                       = each.value.runtime
  timeout_s                     = each.value.timeout_s
  available_memory_mb           = each.value.available_memory_mb
  ingress_settings              = each.value.ingress_settings
  source_directory              = each.value.source_directory
  entry_point                   = each.value.entry_point
  service_account_email         = each.value.service_account_email
  vpc_connector                 = each.value.vpc_connector
  vpc_connector_egress_settings = each.value.vpc_connector_egress_settings
  environment_variables = {
    PROJECT_ID             = each.value.project_id
  }
}

/******************************************
	Resource for Cloud Function IAM member
 *****************************************/

resource "google_cloudfunctions_function_iam_member" "invoker" {
  for_each       = var.cloud_functions
  project        = each.value.project_id
  region         = each.value.region
  cloud_function = each.value.cloud_function_name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
  depends_on = [
    module.cloud_function
  ]
}

