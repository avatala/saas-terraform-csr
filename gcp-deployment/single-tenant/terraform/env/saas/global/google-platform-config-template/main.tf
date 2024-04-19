# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.host_project_prefix_path
 }
}

data "terraform_remote_state" "tenant_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.tenant_id_prefix_path
 }
}

resource "google_identity_platform_tenant_default_supported_idp_config" "idp_config" {
  enabled       = true
  project       = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  tenant        = data.terraform_remote_state.tenant_id.outputs.tenant_name
  idp_id        = "google.com"
  client_id     = var.client_id
  client_secret = var.client_secret
}