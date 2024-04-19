# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "service_name" {
  value = google_cloud_run_service.cloudrun_app.name
  description = "Name of the Cloud Run service"
}

output "url" {
  value = google_cloud_run_service.cloudrun_app.status[0].url
  description = "URL at which the service is available."
}

output "region" {
  value = google_cloud_run_service.cloudrun_app.location
  description = "Region of the service"
}

output "project_id" {
  value = google_cloud_run_service.cloudrun_app.project
  description = "Cloud Run Project ID"
}




