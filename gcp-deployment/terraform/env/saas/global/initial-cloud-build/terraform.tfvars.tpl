# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

seed_project_id = "TEMP_SEED_PROJECT_ID_"


initial_cloud_build_trigger = {
  name        = "saas-terraform-PREFIX_NAME-cloud-build-trigger"
  description = "cloud build trigger for build trigger"
  uri         = ""
  branch      = ""
  location    = "global"
  path        = "gcp-deployment/terraform/env/saas/global/cloud-build-with-branch/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="",
                        "_ZONE"="",
                        "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME",
                        "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_",
                        "_PREFIX" = "PREFIX_NAME",
                        "_ADMIN_DOMAIN" = "",
                        "_ADMIN_REPOSITORY_NAME" = "",
                        "_APP_REPO_GCR_NAME" = "",
                        "_BRANCH_NAME" = "",
                        "_REPO_NAME" = "",
                        "_VENDOR_EMAIL_ID" = ""
                        "_LB_TYPE" = ""
                        "_APIGEE_REQUIRED" = "APIGEE__REQUIRED"
                        "_KMS_KEY_PATH" = "CMEK_PATH"
                        "_SUB_DOMAIN" = "CUSTOMER_DOMAIN"
                    }
}

seed-project-services = {
  project-seed_01 = {
    activate_apis   = ["artifactregistry.googleapis.com","identitytoolkit.googleapis.com","apikeys.googleapis.com", "serviceusage.googleapis.com", "cloudresourcemanager.googleapis.com", "iam.googleapis.com", "secretmanager.googleapis.com", "cloudbuild.googleapis.com", "container.googleapis.com", "logging.googleapis.com", "monitoring.googleapis.com", "containerregistry.googleapis.com", "redis.googleapis.com", "storage.googleapis.com", "iap.googleapis.com", "cloudkms.googleapis.com", "compute.googleapis.com", "dns.googleapis.com", "vpcaccess.googleapis.com", "storage-component.googleapis.com", "file.googleapis.com", "iamcredentials.googleapis.com", "pubsub.googleapis.com", "bigquery.googleapis.com", "run.googleapis.com", "sqladmin.googleapis.com", "anthosgke.googleapis.com", "servicenetworking.googleapis.com", "billingbudgets.googleapis.com", "certificatemanager.googleapis.com", "connectgateway.googleapis.com", "meshconfig.googleapis.com", "mesh.googleapis.com", "gkehub.googleapis.com", "anthos.googleapis.com", "anthosconfigmanagement.googleapis.com", "gkeconnect.googleapis.com", "meshca.googleapis.com", "cloudbilling.googleapis.com", "firebase.googleapis.com", "firebaserules.googleapis.com", "apigee.googleapis.com", "serviceusage.googleapis.com","bigquerydatatransfer.googleapis.com"]
    disable_dependent_services = true
  }
}