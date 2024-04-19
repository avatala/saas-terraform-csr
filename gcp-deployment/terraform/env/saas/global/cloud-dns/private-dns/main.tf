# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */



/******************************************
  Private DNS Zone Details
*****************************************/

module "dns_private_zones" {
  source      = "../../../../modules/terraform-google-cloud-dns/"
  for_each    = var.dns_private_zones
  project_id  = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  type        = "private"
  name        = each.value.name
  description = each.value.description
  domain      = each.value.domain
  labels      = each.value.labels
  recordsets  = each.value.recordsets
  private_visibility_config_networks = [data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01.network["id"]]
}
