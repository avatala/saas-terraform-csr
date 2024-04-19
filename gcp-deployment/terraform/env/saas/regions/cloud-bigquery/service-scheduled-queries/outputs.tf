# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "query_names02" {
  value       = module.svc_prjct_scheduled_queries01.query_names
  description = "The resource names of the transfer config"
}

output "query_names03" {
  value       = module.svc_prjct_scheduled_queries02.query_names
  description = "The resource names of the transfer config"
}