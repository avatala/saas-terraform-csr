# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

host_project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path   = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"
network_state_bucket       = "TF_BUCKET_NAME"
network_prefix_path        = "gcp-deployment/terraform/env/PREFIX_NAME/global/networking/vpc"
gcs_state_bucket          = "TF_BUCKET_NAME"
gcs_prefix_path            = "gcp-deployment/terraform/env/PREFIX_NAME/regions/gcs"


mig_template = {
  name                 = "PREFIX_NAME-instance-template-01"
  machine_type         = "e2-medium"
  source_image_family  = "Ubuntu"
  source_image_project = "ubuntu-os-cloud"
  source_image         = "ubuntu-1804-bionic-v20210928"
  region               = "REGION_NAME"
  subnetwork           = "https://www.googleapis.com/compute/v1/projects/PREFIX_NAME-admin-host/regions/REGION_NAME/subnetworks/PREFIX_NAME-tenant-gke-us-ct1-subnet"
  disk_encryption_key  = "CMEK_KEY_PATH"
  network_tags         = ["allow-iap"]
  mig_name             = "PREFIX_NAME-mig"
  autoscaling_enabled  = true
  min_replicas         = "1"
  max_replicas         = "10"
  autoscaler_name      = "PREFIX_NAME-as"
  health_check_name    = "PREFIX_NAME-hc"
  health_check = {
    type                = "HTTP"
    initial_delay_sec   = 30
    check_interval_sec  = 5
    healthy_threshold   = 2
    timeout_sec         = 5
    unhealthy_threshold = 2
    response            = ""
    port                = 80
    request             = ""
    proxy_header        = "NONE"
    request_path        = "/health"

  }
  named_ports = [{
     name = "http"
     port = 80
  }]
}