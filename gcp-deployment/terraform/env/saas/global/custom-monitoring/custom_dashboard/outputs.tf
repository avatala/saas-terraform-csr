# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "custom_dashboard" {
  description = "The custom dashboard based on selected metrics and filters"
  value       = module.custom-dashboard
}