# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

resource "google_firebase_web_app" "basic" {
  provider        = google-beta
  project         = var.project_id
  display_name    = var.display_name
  deletion_policy = "DELETE"
}


data "google_firebase_web_app_config" "basic" {
  provider   = google-beta
  project         = var.project_id
  web_app_id = google_firebase_web_app.basic.app_id
}