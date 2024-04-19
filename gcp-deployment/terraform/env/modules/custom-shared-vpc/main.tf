# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
	VPC configuration
 *****************************************/
resource "google_compute_network" "network" {
  name                    = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  project                 = var.project_id
  description             = var.description
}

/******************************************
	Shared VPC
 *****************************************/
resource "google_compute_shared_vpc_host_project" "shared_vpc_host" {
  project              = var.project_id
  depends_on           = [google_compute_network.network]
}

resource "google_compute_shared_vpc_service_project" "shared_vpc_service" {
  host_project    = google_compute_shared_vpc_host_project.shared_vpc_host.project
  service_project = var.service_project
}

