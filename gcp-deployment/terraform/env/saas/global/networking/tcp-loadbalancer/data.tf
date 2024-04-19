# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

data "terraform_remote_state" "mig" {
  backend = "gcs"
  config = {
    bucket = var.mig_state_bucket
    prefix = var.mig_prefix_path 
}
}

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.host_project_state_bucket
   prefix = var.host_project_prefix_path
 }
}