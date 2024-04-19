# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Public DNS Zone Outputs
*****************************************/

output "dns_public_zones" {
  description = "The details of the created Cloud DNS public zones."
  value       = module.dns_public_zones
}