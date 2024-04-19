# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


/******************************************
Private Service Access Details
*****************************************/

module "main_vpc_private_service_access" {
  source                  = "../../../../modules/terraform-google-private-service-access"
  project_id              = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  for_each                = var.main_vpc_private_service_access
  vpc_network_self_link   = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_self_link"]
  name                    = each.value.name
  address                 = each.value.address
  prefix_length           = each.value.prefix_length
  labels                  = each.value.labels
  reserved_peering_ranges = each.value.reserved_peering_ranges
}
