# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# ------------------------------------------------------------------------------
# Services Outputs
# ------------------------------------------------------------------------------

output "admin-host-project-services" {
  description = "The GCP project you want to enable APIs on"
  value       = module.admin-host-project-services
}

output "freemium-project-services" {
  description = "The GCP project you want to enable APIs on"
  value       = module.freemium-project-services
}


output "anthos-hub-project-services" {
  description = "The GCP project you want to enable APIs on"
  value       = module.anthos-hub-project-services
}