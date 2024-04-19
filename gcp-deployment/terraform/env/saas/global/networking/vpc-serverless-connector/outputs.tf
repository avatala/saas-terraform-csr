# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
 
/******************************************
	Connector details
 *****************************************/

output "name" {
  value       = module.serverless-connector.name
  description = "Name of the VPC serverless connector"
}

output "connector_ids" {
  value       = module.serverless-connector.connector_ids
  description = "ID of the VPC serverless connector that was deployed."
}

output "serverless-connector" {
  value       = module.serverless-connector
  description = "Name of the VPC serverless connector"
}
