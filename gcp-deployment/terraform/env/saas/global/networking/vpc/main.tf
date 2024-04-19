# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Remote state for Host project
 *****************************************/

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.host_project_prefix_path
 }
}

/******************************************
  Remote state for Service project
 *****************************************/

data "terraform_remote_state" "service_project_name" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.project_name_prefix_path
 }
}


/******************************************
  Details of Shared VPC 
 *****************************************/


module "anthos_hub_vpc" {
  source                  = "../../../../modules/custom-shared-vpc"
  for_each                = var.anthos_hub_vpc
  project_id              = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  network_name            = each.value.network_name
  routing_mode            = each.value.routing_mode
  description             = each.value.description
  shared_vpc_host         = true
  auto_create_subnetworks = false
  service_project         = data.terraform_remote_state.service_project_name.outputs.service_projects.service_project_01["project_name"]
}

module "apigee-admin-pool-vpc" {
  source                  = "../../../../modules/custom-shared-vpc"
  for_each                = var.apigee-admin-pool-vpc
  project_id              = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  network_name            = each.value.pool_network_name
  routing_mode            = each.value.pool_routing_mode
  description             = each.value.pool_vpc_description
  shared_vpc_host         = true
  auto_create_subnetworks = false
  service_project         = data.terraform_remote_state.service_project_name.outputs.service_projects.service_project_01["project_name"]
}