# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
resource "google_project_service" "servicenetworking" {
  project = var.network_project_id
  service = "servicenetworking.googleapis.com"
  disable_on_destroy = false
}

resource "google_compute_global_address" "worker_range" {
  project       = var.network_project_id
  name          = "worker-pool-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       =  "https://www.googleapis.com/compute/v1/${var.network}"
}

resource "google_service_networking_connection" "worker_pool_conn" {
  /* project                 = var.network_project_id */
  network                 = "https://www.googleapis.com/compute/v1/${var.network}"
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.worker_range.name]
  depends_on              = [google_project_service.servicenetworking]
}

resource "google_cloudbuild_worker_pool" "pool" {
  project = var.project_id
  provider = google-beta
  name = var.pool_name
  location = var.region
  worker_config {
    disk_size_gb = var.disk_size_gb
    machine_type = var.machine_type
    no_external_ip = var.no_external_ip_bool
  }
  network_config {
    peered_network = var.network
  }
  depends_on = [google_service_networking_connection.worker_pool_conn]
}

