# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
data "terraform_remote_state" "cloud_build_triggers" {
  backend = "gcs"
  config = {
    bucket = var.cloud_build_trigger_state_bucket
    prefix = var.cloud_build_trigger_prefix_path
  }
}

data "terraform_remote_state" "host_project_id" {
  backend = "gcs"
  config = {
    bucket = var.project_state_bucket
    prefix = var.host_project_prefix_path
  }
}

data "terraform_remote_state" "service_project_id" {
  backend = "gcs"
  config = {
    bucket = var.project_state_bucket
    prefix = var.service_project_prefix_path
  }
}