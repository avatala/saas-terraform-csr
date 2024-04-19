# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


/******************************************
  Cloud Function Outputs
 *****************************************/

output "function_uri" {
  description = "cloud function name"
  value       = module.cloud_function.function_uri
}

output "name" {
  value = module.cloud_function.name
}