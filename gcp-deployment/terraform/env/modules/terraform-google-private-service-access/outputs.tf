# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "address" {
  value       = google_compute_global_address.google-managed-services-range.address
  description = "First IP of the reserved range."
}

output "google_compute_global_address_name" {
  value       = google_compute_global_address.google-managed-services-range.name
  description = "URL of the reserved range."
}

output "peering_completed" {
  value       = null_resource.dependency_setter.id
  description = "Use for enforce ordering between resource creation"
}
