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
  Resource for External Static IPs
 *****************************************/

resource "google_compute_address" "address" {
  count   = 1
  project = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  name    = "PREFIX_NAME-main-vpc-us-ct1-nat-gw-ext-ip-${count.index}"
  region  = var.region
}

/******************************************
  Resource for Cloud Router for NAT GW
 *****************************************/

resource "google_compute_router" "router" {
  project = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  name    = "${data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]}-us-ct1-cr1"
  region  = var.region
  network = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]
}

/******************************************
  NAT gateway module
 *****************************************/

module "cloud-nat" {
  source                             = "../../../../modules/terraform-google-network/nat_gateway"
  project_id                         = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  region                             = var.region
  router                             = google_compute_router.router.name
  name                               = "${data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]}-us-ct1-nat-gw-01"
  nat_ips                            = google_compute_address.address.*.self_link
  min_ports_per_vm                   = "128"
  icmp_idle_timeout_sec              = "15"
  tcp_established_idle_timeout_sec   = "600"
  tcp_transitory_idle_timeout_sec    = "15"
  udp_idle_timeout_sec               = "15"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetworks = [{
  name                     = "PREFIX_NAME-tenant-gke-us-ct1-subnet"
  source_ip_ranges_to_nat  = ["ALL_IP_RANGES"]
  secondary_ip_range_names = ["PREFIX_NAME-tenant-gke-us-ct1-subnet-pod","PREFIX_NAME-tenant-gke-us-ct1-subnet-svc"]
}]
}