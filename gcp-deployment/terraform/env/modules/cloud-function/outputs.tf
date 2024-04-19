# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "function_details" {
  value = google_cloudfunctions2_function.function
}

output "function_uri" {
  value = google_cloudfunctions2_function.function.service_config[0].uri
}

output "name" {
  value = google_cloudfunctions2_function.function.name
}

output "region" {
  value = google_cloudfunctions2_function.function.location
}

