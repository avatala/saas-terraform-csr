# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# ------------------------------------------------------------------------------
# LOAD BALANCER OUTPUTS
# ------------------------------------------------------------------------------

output "freemium_lb_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = module.lb.freemium_lb_ip_address
}

output "enterprise_lb_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = module.lb.enterprise_lb_ip_address
}

output "loadbalancer_name"{
  description = "Name of load balancer name"
  value = module.lb.loadbbalancer_name
}