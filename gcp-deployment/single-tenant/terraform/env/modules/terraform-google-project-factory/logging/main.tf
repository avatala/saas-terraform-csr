# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


/*******************************************
Manages a project-level logging bucket config.
 *****************************************/

resource "google_logging_project_bucket_config" "default_logging_bucket" {
  count          = var.default_logging_retention_days == "" ? 0 : 1
  project        = "projects/${var.project_id}"
  location       = var.location
  retention_days = var.default_logging_retention_days
  bucket_id      = var.bucket_id
}