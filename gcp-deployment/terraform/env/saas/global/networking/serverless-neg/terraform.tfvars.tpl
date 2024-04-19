# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

cloud_run_state_bucket    = "TF_BUCKET_NAME"
cloud_run_prefix_path      = "gcp-deployment/terraform/env/PREFIX_NAME/regions/cloudrun"
project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path   = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"
gcip_state_bucket    = "TF_BUCKET_NAME"
gcip_prefix_path      = "gcp-deployment/terraform/env/PREFIX_NAME/regions/cloudrun-iap"


name                      = "PREFIX_NAME--tenant-cloud-run-neg"
region                    = "REGION_NAME"
master_cf                 = "PREFIX_NAME-tenant-master-cf-neg"
email_verification        = "PREFIX_NAME-tenant-email-verification-neg"
gcip                      = "PREFIX_NAME-tenant-gcip-neg"

master_cf_cloud_run_service_name          = "master-PREFIX_NAME-cloud-function"
email_verification_cloud_run_service_name = "email-verification-PREFIX_NAME-cloud-function"