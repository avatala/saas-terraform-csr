# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "notification_channel" {
  description = "The ID of the notification channel created."
  value       = google_monitoring_notification_channel.notification_channel
}