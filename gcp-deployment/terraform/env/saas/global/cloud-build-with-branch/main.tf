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
  for_each        = var.cloud_build_triggers  
  project_id      = var.seed_project_id
  name            = each.value["name"]
  location        = each.value["location"]
  service_account = each.value["service_account"]
  uri             = each.value["uri"]
  branch          = each.value["branch"]
  path            = each.value["path"]
  substitutions   = each.value["substitutions"]
  disabled        = true
}

module "cloud_build_trigger_apigee" {
  source = "../../../modules/cloud-build-with-branch"
  count = local.apigee_enable ? 1 : 0
  project_id      = var.seed_project_id
  location        = var.cloud_build_main_branch_apigee_trigger["location"]
  name            = var.cloud_build_main_branch_apigee_trigger["name"]
  service_account = var.cloud_build_main_branch_apigee_trigger["service_account"]
  uri             = var.cloud_build_main_branch_apigee_trigger["uri"]
  branch          = var.cloud_build_main_branch_apigee_trigger["branch"]
  path            = var.cloud_build_main_branch_apigee_trigger["path"]
  substitutions   = var.cloud_build_main_branch_apigee_trigger["substitutions"]
  disabled        = true  
}

module "cloud_build_trigger_apigee_components" {
  source = "../../../modules/cloud-build-with-branch"
  count = local.apigee_enable ? 1 : 0
  project_id      = var.seed_project_id
  location        = var.cloud_build_main_branch_apigee_components_trigger["location"]
  name            = var.cloud_build_main_branch_apigee_components_trigger["name"]
  service_account = var.cloud_build_main_branch_apigee_components_trigger["service_account"]
  uri             = var.cloud_build_main_branch_apigee_components_trigger["uri"]
  branch          = var.cloud_build_main_branch_apigee_components_trigger["branch"]
  path            = var.cloud_build_main_branch_apigee_components_trigger["path"]
  substitutions   = var.cloud_build_main_branch_apigee_components_trigger["substitutions"]
  disabled        = true
}