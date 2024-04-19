# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Terraform remote state
 *****************************************/



project_state_bucket = "TF_BUCKET_NAME"
service_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"
host_project_prefix_path = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

/*******************************************************************
  Details of Repoting Cloud BigQuery Dataset for Staging Environment
  ******************************************************************/
saas_bigquery_dataset = {
  bigquery_01 = {
    dataset_id                 = "PREFIX_NAME_us_bigquery01"
    description                = "Stage BQ for realtime reporting"
    location                   = "REGION_NAME"
    delete_contents_on_destroy = false
    encryption_key             = "KMS_KEY"

    dataset_labels = {
      organisation = "PREFIX_NAME"
      createdby   = "terraform"
    }
  }
}

/*******************************************************************
  Details of Repoting Cloud BigQuery Dataset for Host Environment
  ******************************************************************/
saas_bigquery_dataset_host_prjct = {
  bigquery_01 = {
    dataset_id                 = "PREFIX_NAME_us_bigquery_host_prjct"
    description                = "Stage BQ for realtime reporting"
    location                   = "REGION_NAME"
    delete_contents_on_destroy = false
    encryption_key             = "KMS_KEY"

    dataset_labels = {
      organisation = "PREFIX_NAME"
      createdby   = "terraform"
    }
  }
}