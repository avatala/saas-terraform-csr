# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */



/******************************************
  Remote state for Project and Network
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
local variable
*****************************************/

locals {
  fw_rule = var.lb_type == "tcp" ? true : false
}

/******************************************
Firewall rule Details
*****************************************/

module "main_vpc_firewall_rules" {
  source       = "../../../../modules/terraform-google-network/firewall-rules/"
  project_id   = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  network_name = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]
  rules        = var.main_vpc_firewall_rules
}

resource "google_compute_firewall" "tcp_hc" {
  count       = local.fw_rule ? 1 : 0
  project     = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  name        = "tcp-lb-hc-firewall-rule"
  network     = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]
  description = "Creates firewall rule for tcp application health check"
  priority    = 1000
  direction   = "INGRESS"
  allow {
    protocol  = "tcp"
    ports     = var.application_port
  }
  source_ranges = ["35.191.0.0/16", "130.211.0.0/22", "209.85.152.0/22", "209.85.204.0/22"]
}

