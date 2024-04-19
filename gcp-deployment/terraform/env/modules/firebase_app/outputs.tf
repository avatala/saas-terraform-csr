# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "app_id" {
  value = google_firebase_web_app.basic.app_id
}

output "display_name" {
  value = google_firebase_web_app.basic.display_name
}

output "api" {
  value = data.google_firebase_web_app_config.basic.api_key
}

output "auth_domain" {
  value = data.google_firebase_web_app_config.basic.auth_domain
}

output "project" {
  value = data.google_firebase_web_app_config.basic.project
}

output "messaging_sender_id" {
  value = data.google_firebase_web_app_config.basic.messaging_sender_id
}

output "storage_bucket" {
  value = data.google_firebase_web_app_config.basic.storage_bucket
}