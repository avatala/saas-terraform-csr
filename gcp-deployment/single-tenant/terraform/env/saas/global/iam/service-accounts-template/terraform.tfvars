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

/******************************************
Service Account details
*****************************************/

service_accounts = {
  service_account_01 = {
    prefix       = "${_CUSTOMER_NAME}-saas"
    names        = ["gke-sa"]
    display_name = "${_CUSTOMER_NAME}-saas-gke-sa"
    description  = "Service Acount for GKE"
  },
    service_account_02 = {
    prefix       = "${_CUSTOMER_NAME}-saas"
    names        = ["acm-sa"]
    display_name = "${_CUSTOMER_NAME}-saas-acm-sa"
    description  = "Service Acount for GKE ACM"
  },
  service_account_03 = {
    prefix       = "${_CUSTOMER_NAME}-saas"
    names        = ["cloudbq-sa"]
    display_name = "${_CUSTOMER_NAME}-saas-cloudbq-sa"
    description  = "Service Acount for cloud bigquery"
  },
  service_account_04 = {
    prefix       = "${_CUSTOMER_NAME}-saas"
    names        = ["clouddeploy-sa"]
    display_name = "${_CUSTOMER_NAME}-saas-clouddeploy-sa"
    description  = "Service Acount for cloud bigdeploy"
  }
}
