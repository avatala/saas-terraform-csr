# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  VPC Network and Subnet Outputs
 *****************************************/

output "anthos_hub_subnets" {
  value       = module.anthos_hub_subnets
  description = "The details of the created subnets."
}


output "apigee_admin_subnets" {
  value       = module.apigee_admin_subnets
  description = "The details of the created subnets."
}