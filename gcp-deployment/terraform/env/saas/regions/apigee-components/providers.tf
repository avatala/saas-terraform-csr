# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

provider "google" {}

provider "apigee" {
  organization = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  server = "apigee.googleapis.com"
  access_token = data.google_service_account_access_token.default.access_token
}
