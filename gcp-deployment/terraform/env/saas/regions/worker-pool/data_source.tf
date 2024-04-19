# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Remote state for Project and Network
 *****************************************/

data "terraform_remote_state" "service_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.service_project_prefix_path
 }
}

data "terraform_remote_state" "host_project_id" {
  backend = "gcs"
  config = {
    bucket = var.project_state_bucket
    prefix = var.host_project_prefix_path
  }
}

data "terraform_remote_state" "vpc_network" {
 backend = "gcs"
 config = {
   bucket = var.network_state_bucket
   prefix = var.network_prefix_path
 }
}


data "terraform_remote_state" "vpn" {
 backend = "gcs"
 config = {
   bucket = var.vpn_state_bucket
   prefix = var.vpn_prefix_path
 }
}


data "terraform_remote_state" "gke_cluster" {
 backend = "gcs"
 config = {
   bucket = var.gke_state_bucket
   prefix = var.gke_prefix_path
 }
}