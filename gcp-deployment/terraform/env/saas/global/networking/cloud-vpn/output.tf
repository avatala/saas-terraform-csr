# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
output "tunnel_name_gke" {
  value = module.vpn_ha_gke.tunnel_names
}

output "tunnel_name_pool" {
  value = module.vpn_ha_pool.tunnel_names
}

output "router_name_gke" {
  value = module.vpn_ha_gke.router_name
}
output "router_name_pool" {
  value = module.vpn_ha_pool.router_name
}
