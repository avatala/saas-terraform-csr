# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.host_project_state_bucket
   prefix = var.host_project_prefix_path
 }
}

data "terraform_remote_state" "cloud_armor" {
  backend = "gcs"
  config = {
    bucket = var.cloud_armor_state_bucket
    prefix = var.cloud_armor_prefix_path
  }
}

data "terraform_remote_state" "neg" {
  backend = "gcs"
  config = {
    bucket = var.neg_state_bucket
    prefix = var.neg_prefix_path
  }
}

data "terraform_remote_state" "public_dns" {
  backend = "gcs"
  config = {
    bucket = var.dns_state_bucket
    prefix = var.public_dns_prefix_path
  }
}