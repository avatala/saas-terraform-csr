# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "project_name" {
  description = "The name for the project"
  value       = module.project-factory.project_name
}

output "project_id" {
  description = "If provided, the project uses the given project ID. Mutually exclusive with random_project_id being true."
  value       = module.shared_vpc_access.project_id
}

output "project_number" {
  description = "The number for the project"
  value       = module.project-factory.project_number
}

# output "domain" {
#   value       = module.gsuite_group.domain
#   description = "The organization's domain"
# }

# output "group_email" {
#   value       = module.gsuite_group.email
#   description = "The email of the G Suite group with group_name"
# }

output "service_account_id" {
  value       = module.project-factory.service_account_id
  description = "The id of the default service account"
}

output "service_account_display_name" {
  value       = module.project-factory.service_account_display_name
  description = "The display name of the default service account"
}

output "service_account_email" {
  value       = module.project-factory.service_account_email
  description = "The email of the default service account"
}

output "service_account_name" {
  value       = module.project-factory.service_account_name
  description = "The fully-qualified name of the default service account"
}

output "service_account_unique_id" {
  value       = module.project-factory.service_account_unique_id
  description = "The unique id of the default service account"
}

output "project_bucket_self_link" {
  value       = module.project-factory.project_bucket_self_link
  description = "Project's bucket selfLink"
}

output "project_bucket_url" {
  value       = module.project-factory.project_bucket_url
  description = "Project's bucket url"
}