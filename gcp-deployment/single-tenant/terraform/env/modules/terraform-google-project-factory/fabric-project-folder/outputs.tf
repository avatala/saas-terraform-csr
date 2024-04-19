# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "project_id" {
  description = "Project id (depends on services)."
  value       = trimprefix(google_project.project.id, "projects/")
  depends_on  = [google_project_service.project_services]
}

output "name" {
  description = "Name (depends on services)."
  value       = google_project.project.name
  depends_on  = [google_project_service.project_services]
}

output "number" {
  description = "Project number (depends on services)."
  value       = google_project.project.number
  depends_on  = [google_project_service.project_services]
}

output "cloudsvc_service_account" {
  description = "Cloud services service account (depends on services)."
  value       = local.cloudsvc_service_account
  depends_on  = [google_project_service.project_services]
}

output "gce_service_account" {
  description = "Default GCE service account (depends on services)."
  value       = local.gce_service_account
  depends_on  = [google_project_service.project_services]
}

output "gke_service_account" {
  description = "Default GKE service account (depends on services)."
  value       = local.gke_service_account
  depends_on  = [google_project_service.project_services]
}

output "custom_roles" {
  description = "Ids of the created custom roles."
  value       = google_project_iam_custom_role.roles[*].role_id
}

output "default_logging_bucket_id" {
  description = "An identifier for the resource with format projects/{{project}}/locations/{{location}}/buckets/{{bucket_id}}"
  value       = module.default_logging_bucket.id
}

output "billing_id" {
  description = "billing id attached to it"
  value = var.billing_account
}