# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Workload Identity Details 
 *****************************************/

module "workload_identities" {
  source              = "../../../modules/workload-identity"
  for_each            = var.workload_identities
  project_id          = each.value.project_id
  name                = each.value.name
  namespace           = each.value.namespace
  use_existing_k8s_sa = true
  k8s_sa_name         = each.value.k8s_sa_name
  use_existing_gcp_sa = true
  annotate_k8s_sa     = false
}
