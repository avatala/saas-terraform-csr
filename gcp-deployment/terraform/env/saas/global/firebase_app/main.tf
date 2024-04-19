# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Remote state for Host project
 *****************************************/

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.host_project_prefix_path
 }
}

/******************************************
  Details of Firebase App
 *****************************************/

module "firebase_app" {
  source          = "../../../modules/firebase_app/"
  for_each        = var.firebase_app
  project_id      = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  display_name    = each.value.display_name
}

/******************************************
  Details of Secret Manager 
 *****************************************/

module "secret_manager" {
  source     = "../../../modules/terraform-google-secret-manager"
  for_each   = local.secret_manager
  project_id = var.seed_project_id #data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  id         = each.value.id
  secret     = each.value.secret
  labels     = each.value.labels
  user_managed_replication = var.user_managed_replication
}