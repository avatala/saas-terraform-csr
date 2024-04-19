# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Private DNS Zone Outputs
*****************************************/

output "dns_private_zones" {
  description = "The details of the created Cloud DNS private zones."
  value       = module.dns_private_zones
}

