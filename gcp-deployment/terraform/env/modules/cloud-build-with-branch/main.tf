# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

resource "google_cloudbuild_trigger" "manual-trigger" {
  name        = var.name
  project     = var.project_id
  service_account = "${var.service_account}"
  location = var.location
  # source_to_build {
  #   uri       = var.uri
  #   ref       = "refs/heads/${var.branch}"
  #   repo_type = "GITHUB"
  # }
  disabled = var.disabled
  trigger_template {
    branch_name = var.branch
    repo_name   = var.uri
  }  
  substitutions = var.substitutions
  # git_file_source {
  #   path      = var.path
  #   revision  = "refs/heads/${var.branch}"
  #   repo_type = "GITHUB"
  # }
  filename = var.path
# approval_config {
#      approval_required = false
#   }
}
