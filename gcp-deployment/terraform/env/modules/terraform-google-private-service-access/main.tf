# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

# data "google_compute_network" "main" {
#   name    = var.vpc_network
#   project = var.project_id

# }

// We define a VPC peering subnet that will be peered with the
// Cloud SQL instance network. The Cloud SQL instance will
// have a private IP within the provided range.
// https://cloud.google.com/vpc/docs/configure-private-services-access
resource "google_compute_global_address" "google-managed-services-range" {
  provider      = google-beta
  project       = var.project_id
  name          = var.name == "" ? "google-managed-services-${var.vpc_network}" : var.name
  purpose       = "VPC_PEERING"
  address       = var.address
  prefix_length = var.prefix_length
  ip_version    = var.ip_version
  labels        = var.labels
  address_type  = "INTERNAL"
  network       = var.vpc_network_self_link
}

# Creates the peering with the producer network.
resource "google_service_networking_connection" "private_service_access" {
  provider                = google-beta
  network                 = var.vpc_network_self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = var.reserved_peering_ranges
  depends_on = [
    google_compute_global_address.google-managed-services-range
  ]
}

resource "null_resource" "dependency_setter" {
  depends_on = [google_service_networking_connection.private_service_access]
}
