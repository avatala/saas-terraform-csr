# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# ------------------------------------------------------------------------------
# Create Cloudbuild Trigger
# ------------------------------------------------------------------------------
module "initial_cloud_build_trigger" {
  source          = "../../../modules/cloud-build-with-branch"
  project_id      = var.seed_project_id
  name            = var.initial_cloud_build_trigger["name"]
  service_account = var.initial_cloud_build_trigger["service_account"]
  uri             = var.initial_cloud_build_trigger["uri"]
  branch          = var.initial_cloud_build_trigger["branch"]
  path            = var.initial_cloud_build_trigger["path"]
  substitutions   = var.initial_cloud_build_trigger["substitutions"]
  location        = var.initial_cloud_build_trigger["location"]
  disabled        = true
}

module "seed-project-services" {
  source                     = "../../../modules/service-api"
  for_each                   = var.seed-project-services
  disable_dependent_services = each.value.disable_dependent_services
  project_id                 = var.seed_project_id
  activate_apis              = each.value.activate_apis
}