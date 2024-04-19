# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "query_names" {
  value       = module.host_prjct_scheduled_queries.query_names
  description = "The resource names of the transfer config"
}