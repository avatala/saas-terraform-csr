# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Remote state for Project
 *****************************************/

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.host_project_prefix_path
 }
}

data "terraform_remote_state" "vpc_network" {
  backend = "gcs"
  config = {
    bucket = var.network_state_bucket
    prefix = var.network_prefix_path
  }
}

/******************************************
  Subnet Details
 *****************************************/
module "anthos_hub_subnets" {
  source = "../../../../modules/terraform-google-network/subnets-beta"
  project_id       = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  for_each         = var.anthos_hub_subnets
  network_name     = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]
  subnets          = each.value.subnets
  secondary_ranges = each.value.secondary_ranges
}


module "apigee_admin_subnets" {
  source = "../../../../modules/terraform-google-network/subnets-beta"
  project_id       = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  for_each         = var.apigee_admin_subnets
  network_name     = data.terraform_remote_state.vpc_network.outputs.apigee-admin-pool-vpc.apigee-admin-pool-vpc_01["network_name"]
  subnets          = each.value.subnets
  secondary_ranges = each.value.secondary_ranges
}