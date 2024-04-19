# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Remote state for GKE Cluster & worker pool
 *****************************************/

data "terraform_remote_state" "gke_cluster" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.gke_prefix_path
 }
}

data "terraform_remote_state" "worker_pool" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.worker_pool_prefix_path
 }
}