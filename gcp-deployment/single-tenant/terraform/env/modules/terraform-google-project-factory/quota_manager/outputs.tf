# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "quota_overrides" {
  description = "The server-generated names of the quota override."
  value       = google_service_usage_consumer_quota_override.override
}
