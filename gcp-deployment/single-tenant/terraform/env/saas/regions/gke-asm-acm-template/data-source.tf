# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
data "terraform_remote_state" "gke_cluster" {
  backend = "gcs"
  config = {
    bucket = var.gke_state_bucket 
    prefix = var.gke_prefix_path 
  }
}

data "terraform_remote_state" "service_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.service_project_prefix_path
 }
}

data "terraform_remote_state" "anthos_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.anthos_project_prefix_path
 }
}

data "terraform_remote_state" "service_account" {
  backend = "gcs"
  config = {
    bucket = var.service_account_state_bucket
    prefix = var.service_account_prefix_path
  }
}