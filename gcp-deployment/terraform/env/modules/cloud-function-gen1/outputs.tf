# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
 
output "name" {
  description = "The name of the function."
  value       = google_cloudfunctions_function.main.name
}

output "https_trigger_url" {
  description = "URL which triggers function execution."
  value       = var.trigger_http != null ? google_cloudfunctions_function.main.https_trigger_url : ""
}

