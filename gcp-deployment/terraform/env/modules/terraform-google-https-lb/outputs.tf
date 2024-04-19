# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "freemium_lb_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = google_compute_global_address.freemium_ip.address
}
output "enterprise_lb_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = google_compute_global_address.enterprise_ip.address
}

output "admin_lb_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = google_compute_global_address.admin_ip.address
}

output "master_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = google_compute_global_address.master_cf_ip.address
}

output "email_verification_lb_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = google_compute_global_address.email_verification_ip.address
}

output "gcip_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = google_compute_global_address.gcip_ip.address
}

output "loadbbalancer_name" {
  description ="Name of load balancer"
  value = google_compute_url_map.urlmap.name
}

