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

output "service_accounts_iam_email" {
  description = "The details of the created Service Accounts."
  value       = module.service_accounts["service_account_03"].service_account
}

output "service_accounts_iam_mig_email" {
  description = "The details of the created Service Accounts."
  value       = module.host_service_accounts["host_service_account_01"].service_account
}

output "service_accounts_anthos_hub" {
  description = "The details of the created Service Accounts."
  value       = module.anthos_hub_service_accounts["anthos_hub_service_accounts01"].service_account
}

output "service_accounts_acm" {
  description = "The details of the created Service Accounts."
  value       = module.anthos_hub_service_accounts["anthos_hub_service_accounts02"].service_account
}
