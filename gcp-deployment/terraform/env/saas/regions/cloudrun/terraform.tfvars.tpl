# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
	Cloud Run Details
 *****************************************/


project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

cloudrun_apps = {
  cloudrun_app_01 = {
    cloudrun_service_config = {
      service_name             = "PREFIX_NAME-tenant-cloud-run"
      container_image          = "REGION_NAME-docker.pkg.dev/PREFIX_NAME-admin-host/adminportal/adminportal-optimisation-PREFIX_NAME:latest"
      service_account_name     = "PREFIX_NAME-cloudrun-sa@PREFIX_NAME-admin-host.iam.gserviceaccount.com"
      max_instances            = 2
      min_instances            = 1
      container_concurrency    = 80
      timeout_seconds          = 300
      traffic_percent          = 100
      container_label          = "apps"
      cloudrun_label           = "cr-svc"
      cpu_limits               = "2.0"
      memory_limits            = "4G"
      cpu_requests             = "2.0"
      memory_requests          = "4"
      binary_authorization     = "default"
      kms_key_path             = "KMS_KEY_PATH"
    }
    ingress_type =  "internal-and-cloud-load-balancing"
    container_port = 80
    region_name    = "REGION_NAME"
    member        = "allUsers"
  }
}