# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "workload_identities" {
  description = "The details of the created Workload Identity creation for existing GSA and KSA."
  value       = module.workload_identities
}