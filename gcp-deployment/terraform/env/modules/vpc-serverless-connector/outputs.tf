# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "connector_ids" {
  value = toset([
  for k in google_vpc_access_connector.connector_beta : k.id])
  description = "VPC serverless connector ID."
}

output "name" {
  value = toset([
  for k in google_vpc_access_connector.connector_beta : k.name])
  description = "Name of the VPC serverless connector"
}

output "project" {
  value = toset([
  for k in google_vpc_access_connector.connector_beta : k.project])
  description = "VPC serverless connector Project ID"
}

output "region" {
  value = toset([
  for k in google_vpc_access_connector.connector_beta : k.region])
  description = "Region of the VPC serverless connector."
}
