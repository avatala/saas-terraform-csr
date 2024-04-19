# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Workload Identity Details 
 *****************************************/

workload_identities = {
  workload_identity_01 = {
    project_id  = "PREFIX_NAME-anthos-hub"
    name        = "PREFIX_NAME-anthos-acm-sa"
    namespace   = "config-management-system"
    k8s_sa_name = "root-reconciler"
  },
  workload_identity_02 = {
    project_id  = "PREFIX_NAME-freemium-prj"
    name        = "PREFIX_NAME-cronjob"
    namespace   = "cronjob"
    k8s_sa_name = "cronjob"
  }
}