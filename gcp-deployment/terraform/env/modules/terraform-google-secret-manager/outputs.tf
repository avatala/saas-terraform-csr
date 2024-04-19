# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


output "id" {
  value       = google_secret_manager_secret.secret.id
  description = "The fully-qualified id of the Secret Manager key that contains the secret."
}

output "secret_id" {
  value       = google_secret_manager_secret.secret.secret_id
  description = "The project-local id Secret Manager key that contains the secret. Should match the input `id`."
}

output "secret_version_id" {
  value       = google_secret_manager_secret_version.secret.id
  description = "The version id of the created secret"
}

output "secret_version_data" {
  value       = google_secret_manager_secret_version.secret.secret_data
  description = "The version data of the created secret"
}