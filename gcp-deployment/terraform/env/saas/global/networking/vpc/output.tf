# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


output "anthos_hub_vpc" {
  value       = module.anthos_hub_vpc
  description = "The details of shared vpc"
}

output "apigee-admin-pool-vpc" {
  value       = module.apigee-admin-pool-vpc
  description = "The details of shared vpc"
}
