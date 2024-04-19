# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Module for secret manager
 *****************************************/

module "secret_manager" {
  source     = "../../../modules/terraform-google-secret-manager"
  for_each   = var.secret_manager
  project_id = "${_SEED_PROJECT_ID}"
  id         = each.value.id
  secret     = each.value.secret
  labels     = each.value.labels
  user_managed_replication = var.user_managed_replication
}

