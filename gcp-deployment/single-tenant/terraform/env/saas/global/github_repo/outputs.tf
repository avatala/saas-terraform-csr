# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  GitHub Repository Outputs
 *****************************************/

output "infrastructure_repo" {
  value       = module.infrastructure_repo
  description = "The details of the created gitHub repository."
}

output "github_webhook" {
  value       = module.github_webhook
  description = "The details of the configured gitHub webhook."
}