# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "loadbbalancer_name" {
  description ="Name of load balancer"
  value = google_compute_url_map.urlmap.name
}

output "admin_lb_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = google_compute_global_address.admin_ip.address
}

