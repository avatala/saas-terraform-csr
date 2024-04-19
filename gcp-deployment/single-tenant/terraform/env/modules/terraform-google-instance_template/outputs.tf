# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "self_link" {
  description = "Self-link of instance template"
  value       = google_compute_instance_template.tpl.self_link
}

output "name" {
  description = "Name of instance template"
  value       = google_compute_instance_template.tpl.name
}

output "tags" {
  description = "Tags that will be associated with instance(s)"
  value       = google_compute_instance_template.tpl.tags
}
