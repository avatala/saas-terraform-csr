# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
resource "google_certificate_manager_certificate_map" "certificate_map" {
   project     = var.project_id
   name        = var.cert_map_name
   description = "The acceptance certificate map"
    labels      = var.cert_map_labels
 }
 resource "google_certificate_manager_certificate_map_entry" "default" {
   project     = var.project_id
   name        = var.cert_map_name_entry
   description = "The acceptance certificate map entry"
   map = var.cert_map_name
    labels      = {
      "terraform" : true,
      "acc-test"  : true,
    }
   certificates = var.certificates
   matcher = "PRIMARY"
   #hostname = var.hostname
   depends_on = [
     google_certificate_manager_certificate_map.certificate_map
   ]
 }




