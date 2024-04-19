# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# ------------------------------------------------------------------------------
# Create Cloudbuild Trigger
# ------------------------------------------------------------------------------

module "cloud_build_triggers" {
  source          = "../../../modules/cloud-build-with-branch"
  for_each        = local.cloud_build_triggers
  project_id      = "${_SEED_PROJECT_ID}"
  name            = each.value["name"]
  service_account = "saas-cloudbuild-sa@${_SEED_PROJECT_ID}.iam.gserviceaccount.com"
  uri             = each.value["uri"]
  branch          = each.value["branch"]
  path            = each.value["path"]
  location        = each.value["location"]
  substitutions   = each.value["substitutions"]
  disabled        = true
}

module "cloud_build_trigger_apigee_components" {
  source          = "../../../modules/cloud-build-with-branch"
  count = local.apigee_enable ? 1 : 0
  project_id      = "${_SEED_PROJECT_ID}"
  name            = local.cloud_build_main_branch_apigee_components_trigger["name"]
  service_account = "saas-cloudbuild-sa@${_SEED_PROJECT_ID}.iam.gserviceaccount.com"
  uri             = local.cloud_build_main_branch_apigee_components_trigger["uri"]
  branch          = local.cloud_build_main_branch_apigee_components_trigger["branch"]
  path            = local.cloud_build_main_branch_apigee_components_trigger["path"]
  location        = local.cloud_build_main_branch_apigee_components_trigger["location"]
  substitutions   = local.cloud_build_main_branch_apigee_components_trigger["substitutions"]
  disabled        = true
}