# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "id" {
  value = google_compute_security_policy.policy.id
}

output "ip_ranges_rules" {
  value = var.ip_ranges_rules
}