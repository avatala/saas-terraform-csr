# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
/******************************************
  Remote state for Project
 *****************************************/

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.host_project_prefix_path
 }
}


/******************************************
  IAP details
 *****************************************/

module "project_iap_iam_bindings" {
  source   = "../../../modules/terraform-google-iam/projects_iam/"
  projects = [data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]]
  mode     = "additive"

  bindings = {
    "roles/iap.httpsResourceAccessor" = var.users
  }
}