# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
output "mig_self_link" {
  description = "Self-link of managed instance group"
  value       = module.mig.instance_group
}

output "mig_instance_group" {
  description = "Instance-group url of managed instance group"
  value       = module.mig.instance_group_manager
}

output "mig_instance_group_manager" {
  description = "An instance of google_compute_region_instance_group_manager of the instance group."
  value       = module.mig.self_link
}