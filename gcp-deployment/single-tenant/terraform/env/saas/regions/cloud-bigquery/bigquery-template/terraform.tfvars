# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Terraform remote state
 *****************************************/


project_state_bucket         = "${TF_STATE_BUCKET_NAME}"

service_project_prefix_path  = "gcp-deployment/terraform/env/single-tenant/resource-hierarchy/projects/${_CUSTOMER_NAME}-service-projects"
/*******************************************************************
  Details of Repoting Cloud BigQuery Dataset for Staging Environment
  ******************************************************************/
saas_bigquery_dataset = {
  bigquery_01 = {
    dataset_id                 = "${_CUSTOMER_NAME}_saas_dsid"
    description                = "Stage BQ for realtime reporting"
    location                   = "${_PRE_REQ_REGION}"
    delete_contents_on_destroy = false
    encryption_key             = "${_KMS_KEY_PATH}"

    dataset_labels = {
      organisation = "saas"
      createdby   = "terraform"
    }
  }
}