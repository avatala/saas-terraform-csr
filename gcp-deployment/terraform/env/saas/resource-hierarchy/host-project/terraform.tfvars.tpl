# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
 Standalone Project Creation
*****************************************/

standalone_projects = {
  standalone_project_01 = {
    project_name                   = "admin-host"
    #project_name                   = "HOST_PROJECT_ID_"
    billing_account                = "BILLING_ACCOUNT_ID"
    folder_id                      = "folders/ROOT_FOLDER_ID"
    prefix                         = "PREFIX_NAME"
    activate_apis                  = ["container.googleapis.com","firestore.googleapis.com","logging.googleapis.com", "monitoring.googleapis.com", "containerregistry.googleapis.com", "redis.googleapis.com", "storage.googleapis.com", "cloudidentity.googleapis.com", "iap.googleapis.com", "cloudkms.googleapis.com", "cloudresourcemanager.googleapis.com","compute.googleapis.com",  "dns.googleapis.com", "artifactregistry.googleapis.com", "vpcaccess.googleapis.com", "cloudbuild.googleapis.com", "storage-component.googleapis.com", "file.googleapis.com", "iam.googleapis.com", "iamcredentials.googleapis.com", "pubsub.googleapis.com", "secretmanager.googleapis.com", "bigquery.googleapis.com", "run.googleapis.com", "sqladmin.googleapis.com", "anthosgke.googleapis.com", "sourcerepo.googleapis.com", "servicenetworking.googleapis.com","billingbudgets.googleapis.com","cloudbilling.googleapis.com","certificatemanager.googleapis.com","cloudfunctions.googleapis.com"]
    default_logging_retention_days = 30
    labels = {
      "organization" = "PREFIX_NAME-accelerator"
      "environment"  = "dev"
      "createdby"    = "terraform"
      "type"         = "standalone"
    }
  }
}
