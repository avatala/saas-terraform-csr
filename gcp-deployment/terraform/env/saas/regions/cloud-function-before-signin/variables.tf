# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Variables for Cloud Function
 *****************************************/

variable "cloud_functions" {
  description = "Details of the cloud function."
  type = map(object({
  trigger_http                  = bool,
  labels                        = map(string),
  cloud_function_name           = string,
  project_id                    = string,
  region                        = string,
  runtime                       = string,
  timeout_s                     = string,
  available_memory_mb           = string,
  ingress_settings              = string,
  service_account_email         = string,
  source_directory              = string,
  entry_point                   = string,
  vpc_connector                 = string,
  vpc_connector_egress_settings = string,
  }))
  default = {
    cloud_function = {
  trigger_http                  = true
  labels                        = {}
  cloud_function_name           = ""
  project_id                    = ""
  region                        = ""
  service_account_email         = ""
  runtime                       = ""
  vpc_connector                 = ""
  timeout_s                     = ""
  available_memory_mb           = ""
  ingress_settings              = ""
  source_directory              = ""
  entry_point                   = ""
  vpc_connector_egress_settings = ""
    }
  }
}
