# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Firewall rule Outputs
 *****************************************/

output "main_vpc_firewall_rules" {
  value       = module.main_vpc_firewall_rules.firewall_rules
  description = "The details of the created firewall rules."
}