# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "project_name" {
  value = google_project.main.name
}

output "project_id" {
  value = module.project_services.project_id
  depends_on = [
    module.project_services,
    google_project.main,
    google_compute_shared_vpc_service_project.shared_vpc_attachment,
    google_compute_shared_vpc_host_project.shared_vpc_host,
  ]
}

output "project_number" {
  value      = google_project.main.number
  depends_on = [module.project_services]
}

output "service_account_id" {
  value       = var.create_project_sa ? google_service_account.default_service_account[0].account_id : ""
  description = "The id of the default service account"
}

output "service_account_display_name" {
  value       = var.create_project_sa ? google_service_account.default_service_account[0].display_name : ""
  description = "The display name of the default service account"
}

output "service_account_email" {
  value       = var.create_project_sa ? google_service_account.default_service_account[0].email : ""
  description = "The email of the default service account"
}

output "service_account_name" {
  value       = var.create_project_sa ? google_service_account.default_service_account[0].name : ""
  description = "The fully-qualified name of the default service account"
}

output "service_account_unique_id" {
  value       = var.create_project_sa ? google_service_account.default_service_account[0].unique_id : ""
  description = "The unique id of the default service account"
}

output "project_bucket_name" {
  description = "The name of the projec's bucket"
  value       = google_storage_bucket.project_bucket.*.name
}

output "project_bucket_self_link" {
  value       = google_storage_bucket.project_bucket.*.self_link
  description = "Project's bucket selfLink"
}

output "project_bucket_url" {
  value       = google_storage_bucket.project_bucket.*.url
  description = "Project's bucket url"
}

output "api_s_account" {
  value       = local.api_s_account
  description = "API service account email"
}

output "api_s_account_fmt" {
  value       = local.api_s_account_fmt
  description = "API service account email formatted for terraform use"
}

output "enabled_apis" {
  description = "Enabled APIs in the project"
  value       = module.project_services.enabled_apis
}

output "enabled_api_identities" {
  description = "Enabled API identities in the project"
  value       = module.project_services.enabled_api_identities
}

output "default_logging_bucket_id" {
  description = "An identifier for the resource with format projects/{{project}}/locations/{{location}}/buckets/{{bucket_id}}"
  value       = module.default_logging_bucket.id
}