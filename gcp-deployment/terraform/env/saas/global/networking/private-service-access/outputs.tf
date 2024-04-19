# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
Private Service Access Outputs
*****************************************/

output "main_vpc_private_service_access" {
  description = "The details of the created Private Service Access."
  value       = module.main_vpc_private_service_access
}