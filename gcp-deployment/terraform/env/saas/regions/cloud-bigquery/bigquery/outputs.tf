# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "saas_bigquery_dataset" {
  description = "The details of the Stage BQ for realtime reporting"
  value       = module.saas_bigquery_dataset
}

output "output_bigquery_dataset" {
  description = "The details of the Stage BQ for realtime reporting"
  value       = module.saas_bigquery_dataset["bigquery_01"].bigquery_dataset
}

output "saas_bigquery_dataset_host_prjct" {
  description = "The details of the Stage BQ for realtime reporting"
  value       = module.saas_bigquery_dataset_host_prjct
}

output "output_bigquery_dataset_host_prjct" {
  description = "The details of the Stage BQ for realtime reporting"
  value       = module.saas_bigquery_dataset_host_prjct["bigquery_01"].bigquery_dataset
}

# output "freemium_output_bigquery_dataset" {
#   description = "The details of the Stage BQ for realtime reporting"
#   value       = module.saas_bigquery_dataset["bigquery_02"].bigquery_dataset
# }