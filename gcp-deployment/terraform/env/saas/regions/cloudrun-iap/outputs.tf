# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
	Cloud Run Outputs
 *****************************************/

output "gcip_url" {
  description = "Details of the created Cloud Run App."
  value       = module.cloudrun_apps["cloudrun_app_01"].url
}

output "gcip_name" {
  description = "Details of the created Cloud Run App."
  value       = module.cloudrun_apps["cloudrun_app_01"].service_name
}