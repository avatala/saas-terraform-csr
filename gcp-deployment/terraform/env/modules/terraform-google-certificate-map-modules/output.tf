# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
output "map_id" {
    value = google_certificate_manager_certificate_map.certificate_map.id
  }

# output "hostname" {
#     value = var.hostname
# }