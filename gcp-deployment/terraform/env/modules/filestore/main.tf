# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
resource "google_filestore_instance" "instance" {
  name     = var.name
  location = var.location
  tier     = var.tier
  project  = var.project_id
  file_shares {
    capacity_gb = var.capacity_gb
    name        = var.file_shares_name
  }
  networks {
    network           = var.network
    modes             = var.modes
    reserved_ip_range = var.reserved_ip_range
    connect_mode      = var.connect_mode
  }

}