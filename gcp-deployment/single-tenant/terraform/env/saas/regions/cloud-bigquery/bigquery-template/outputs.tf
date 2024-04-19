# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "saas_bigquery_dataset" {
  description = "The details of the Stage BQ for realtime reporting"
  value       = module.saas_bigquery_dataset["bigquery_01"].bigquery_dataset
}