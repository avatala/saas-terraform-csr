# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
output "trigger_id" {
  value = google_cloudbuild_trigger.manual-trigger.trigger_id
}

output "trigger_location" {
  value = google_cloudbuild_trigger.manual-trigger.location
}