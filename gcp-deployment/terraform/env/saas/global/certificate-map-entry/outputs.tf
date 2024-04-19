# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
output "freemium_map_id" {
    value = module.freemium_certificate_manager_map.map_id
  }

output "enterprise_map_id" {
    value = module.enterprise_certificate_manager_map.map_id
  }