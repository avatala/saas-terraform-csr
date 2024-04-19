# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
output "apigee-x-core" {
  description = "ApigeeX Org Details"
  value       = module.apigee-x-core
}

output "apigee-x-bridge-mig" {
  description = "Self-link of managed instance group"
  value       = module.apigee-x-bridge-mig
}

output "apigee-x-global-https-lb" {
  description = "ApigeeX GLB IP"
  value = module.apigee-x-global-https-lb["PREFIX_NAME-apigee-instance"].apigee_bridge_mig_lb_ip_address
}
