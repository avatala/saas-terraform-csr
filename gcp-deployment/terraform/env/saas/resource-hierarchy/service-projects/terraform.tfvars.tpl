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
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

default_network_tier = "PREMIUM"


/******************************************
 Service Project Details
*****************************************/
service_projects = {
    service_project_01 = {
    project_name                   = "PREFIX_NAME-anthos-hub"
    billing_account                = "BILLING_ACCOUNT_ID"
    folder_id                      = "ROOT_FOLDER_ID"
    activate_apis                  = ["storage.googleapis.com","compute.googleapis.com", "container.googleapis.com", "cloudbuild.googleapis.com", "dns.googleapis.com", "artifactregistry.googleapis.com", "vpcaccess.googleapis.com", "cloudbuild.googleapis.com", "storage-component.googleapis.com", "file.googleapis.com", "iam.googleapis.com", "iamcredentials.googleapis.com", "pubsub.googleapis.com", "secretmanager.googleapis.com", "bigquery.googleapis.com", "run.googleapis.com", "sqladmin.googleapis.com"]
    default_logging_retention_days = 30
    grant_services_network_role    = false
    labels = {
      "purpose"               = "anthos-hub"
      "environment"           = "dev"
      "createdby"             = "terraform"
      "type"                  = "service-project"
    }
    metadata = [
      {
        key   = "enable-oslogin"
        value = "TRUE"
      }
    ]
  }
  service_project_02 = {
    project_name                   = "PREFIX_NAME-freemium-prj"
    billing_account                = "BILLING_ACCOUNT_ID"
    folder_id                      = "ROOT_FOLDER_ID"
    activate_apis                  = ["binaryauthorization.googleapis.com","clouddeploy.googleapis.com","storage.googleapis.com","compute.googleapis.com", "container.googleapis.com", "cloudbuild.googleapis.com", "dns.googleapis.com", "artifactregistry.googleapis.com", "vpcaccess.googleapis.com", "cloudbuild.googleapis.com", "storage-component.googleapis.com", "file.googleapis.com", "iam.googleapis.com", "iamcredentials.googleapis.com", "pubsub.googleapis.com", "secretmanager.googleapis.com", "bigquery.googleapis.com", "run.googleapis.com", "sqladmin.googleapis.com"]
    default_logging_retention_days = 30
    grant_services_network_role    = false
    labels = {
      "purpose"               = "freemium"
      "createdby"             = "terraform"
      "type"                  = "service-project"
    }
    metadata = [
      {
        key   = "enable-oslogin"
        value = "TRUE"
      }
    ]
  }
}
