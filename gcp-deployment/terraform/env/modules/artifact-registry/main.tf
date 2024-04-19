# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

resource "google_artifact_registry_repository" "my-repo" {
  location      = var.region_name
  project       = var.project_id 
  repository_id = var.repo_id
  description   = var.description
  format        = var.format_type
  labels        = var.labels
}