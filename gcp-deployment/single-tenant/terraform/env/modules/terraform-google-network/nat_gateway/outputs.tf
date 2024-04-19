# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "name" {
  description = "Name of the Cloud NAT"
  value       = local.name
}

output "nat_ip_allocate_option" {
  description = "NAT IP allocation mode"
  value       = local.nat_ip_allocate_option
}

output "region" {
  description = "Cloud NAT region"
  value       = google_compute_router_nat.main.region
}

output "router_name" {
  description = "Cloud NAT router name"
  value       = local.router
}
