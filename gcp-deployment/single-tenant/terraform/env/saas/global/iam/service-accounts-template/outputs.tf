# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
Service Account Outputs
*****************************************/

output "service_accounts" {
  description = "The details of the created Service Accounts."
  value       = module.service_accounts
  sensitive   = true
}