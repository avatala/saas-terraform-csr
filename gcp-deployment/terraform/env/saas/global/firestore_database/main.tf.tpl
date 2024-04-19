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
  Firestore Database Details
 *****************************************/

module "firestore_database" {
  source     = "../../../modules/firestore_database"
  project_id = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  region     = "REGION_NAME"
}