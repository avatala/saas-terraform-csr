# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

module "host_prjct_scheduled_queries" {
  source                 = "../../../../modules/scheduled_queries"
  project_id             = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  queries = [
    {
      name                   = "GKE Usage Metering Cost Breakdown Scheduled Query for host project"
      location               = "REGION_NAME"
      destination_dataset_id = data.terraform_remote_state.bigquery_dataset_id.outputs.output_bigquery_dataset_host_prjct["dataset_id"]
      data_source_id         = "scheduled_query"
      schedule               = "every day 06:00"
      params = {
        destination_table_name_template = "usage_metering_cost_breakdown"
        write_disposition               = "WRITE_APPEND"
        query                           = file("./host_prjct_query")
      }
    }
  ]
}