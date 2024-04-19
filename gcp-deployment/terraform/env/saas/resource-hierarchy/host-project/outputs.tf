# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "standalone_projects" {
  value       = module.standalone_projects
  description = "The details of the GCP Standalone projects."
}