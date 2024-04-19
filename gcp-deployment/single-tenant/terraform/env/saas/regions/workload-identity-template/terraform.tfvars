# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

project_state_bucket         = "${TF_STATE_BUCKET_NAME}"

service_project_prefix_path  = "gcp-deployment/terraform/env/single-tenant/resource-hierarchy/projects/${_CUSTOMER_NAME}-service-projects"

/******************************************
  Workload Identity Details 
 *****************************************/

workload_identities = {
  workload_identity_01 = {
    name        = "${_CUSTOMER_NAME}-saas-acm-sa"
    namespace   = "config-management-system"
    k8s_sa_name = "root-reconciler"
  }
}