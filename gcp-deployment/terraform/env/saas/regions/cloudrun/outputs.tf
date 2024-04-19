# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
	Cloud Run Outputs
 *****************************************/

output "cloudrun_apps" {
  description = "Details of the created Cloud Run App."
  value       = module.cloudrun_apps
}
