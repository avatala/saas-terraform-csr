# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


output "id" {
  description = "An identifier for the resource with format projects/{{project}}/locations/{{location}}/buckets/{{bucket_id}}"
  value       = resource.google_logging_project_bucket_config.default_logging_bucket.*.id
}

output "name" {
  description = "The resource name of the bucket. For example: projects/my-project-id/locations/my-location/buckets/my-bucket-id"
  value       = resource.google_logging_project_bucket_config.default_logging_bucket.*.name
}

output "lifecycle_state" {
  description = "The bucket's lifecycle such as active or deleted. See LifecycleState."
  value       = resource.google_logging_project_bucket_config.default_logging_bucket.*.lifecycle_state
}