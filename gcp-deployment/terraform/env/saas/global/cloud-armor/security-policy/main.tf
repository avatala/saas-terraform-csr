# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/************************************************
  Remote state for Project
 ************************************************/

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.host_project_prefix_path
 }
}

/******************************************
  Security Policy Details
 *****************************************/

module "security_policies" {
  source          = "../../../../modules/terraform-google-cloud-armor/security-policy"
  project         = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  name            = var.name
  ip_ranges_rules = var.ip_ranges_rules
  owasp_rules     = var.owasp_rules
  countries_rules = var.countries_rules
}