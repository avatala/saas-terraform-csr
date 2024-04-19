# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "query_names" {
  value = concat(
    values({ for k, v in google_bigquery_data_transfer_config.query_config : k => v.name }),
  )

  description = "The resource names of the transfer config"
}
