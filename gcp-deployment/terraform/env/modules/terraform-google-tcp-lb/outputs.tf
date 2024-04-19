# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "freemium_lb_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = google_compute_global_address.tcp_freemium_ip.address
}
output "enterprise_lb_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = google_compute_global_address.tcp_enterprise_ip.address
}