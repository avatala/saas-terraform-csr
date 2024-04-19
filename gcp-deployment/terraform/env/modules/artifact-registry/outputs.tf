# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "region" {
  value = google_artifact_registry_repository.my-repo.location
  description = "Region of the service"
}

output "repo_name" {
  value = google_artifact_registry_repository.my-repo.repository_id
  description = "GAR name"
}