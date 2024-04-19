# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

data "terraform_remote_state" "service_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.service_project_prefix_path
 }
}

data "terraform_remote_state" "bigquery_dataset_id" {
 backend = "gcs"
 config = {
   bucket = var.dataset_state_bucket
   prefix = var.dataset_prefix_path
 }
}