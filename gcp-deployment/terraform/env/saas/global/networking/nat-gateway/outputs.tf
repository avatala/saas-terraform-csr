# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
/******************************************
  NAT gateway outputs
 *****************************************/
output "cloud_nat_name" {
  description = "Name of the Cloud NAT"
  value       = module.cloud-nat.name
}