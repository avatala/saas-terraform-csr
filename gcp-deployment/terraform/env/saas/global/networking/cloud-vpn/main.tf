# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
/******************************************
	VPN gcp to on-prem
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


module "vpn_ha_gke" {
  source           = "../../../../modules/cloud-vpn"
  project_id       = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  region           = var.region
  network          = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]
  name             = var.vpn_name_gke
  router_asn       = var.router_asn_gke
  peer_gcp_gateway = module.vpn_ha_pool.self_link
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.0.2"
        asn     = var.router_asn_pool
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.0.1/16"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = 0
      shared_secret                   = var.secret_key_phrase0
    }
  }
}

module "vpn_ha_pool" {
  source           = "../../../../modules/cloud-vpn"
  project_id       = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  region           = var.region
  network          = data.terraform_remote_state.vpc_network.outputs.apigee-admin-pool-vpc.apigee-admin-pool-vpc_01["network_name"]
  name             = var.vpn_name_pool
  router_asn       = var.router_asn_pool
  peer_gcp_gateway = module.vpn_ha_gke.self_link
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.0.1"
        asn     = var.router_asn_gke
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.0.2/16"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = 0
      shared_secret                   = var.secret_key_phrase0
    }
  }
}