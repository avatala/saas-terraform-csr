# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "roles" {
  value       = google_project_iam_member.project_iam_member
  description = "Project roles."
}

output "project_id" {
  value       = var.project_id
  description = "Project id."
}
