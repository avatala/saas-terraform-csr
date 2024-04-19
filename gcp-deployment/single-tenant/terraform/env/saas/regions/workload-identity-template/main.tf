# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

 /******************************************
  Data source for project id
 *****************************************/

data "terraform_remote_state" "service_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.service_project_prefix_path
 }
}


/******************************************
  Workload Identity Details 
 *****************************************/

module "workload_identities" {
  source              = "../../../modules/workload-identity"
  for_each            = var.workload_identities
  project_id          = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  name                = each.value.name
  namespace           = each.value.namespace
  use_existing_k8s_sa = true
  k8s_sa_name         = each.value.k8s_sa_name
  use_existing_gcp_sa = true
  annotate_k8s_sa     = false
}
