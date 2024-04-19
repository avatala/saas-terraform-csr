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
dns_state_bucket             = "TF_BUCKET_NAME"
public_dns_prefix_path       = "gcp-deployment/terraform/env/PREFIX_NAME/global/cloud-dns/public-dns"

organization = {
    display_name            = "SAAS Apigee Org"
    description             = "Apigee organization for SAAS environment"
    runtime_type            = "CLOUD"
    billing_type            = "EVALUATION"
    analytics_region        = "us-central1"
    database_encryption_key = null
  }

envgroups = {
    PREFIX_NAME-envgroup = ["apigee-saas.PREFIX_NAME.FULL_ADMIN_DOMAIN"]
}

environments = {
PREFIX_NAME-env = {
      display_name    = "PREFIX_NAME-env"
      description     = "Apigee SAAS Environment"
      envgroups       = ["PREFIX_NAME-envgroup"]
      api_proxy_type = "PROGRAMMABLE"
      deployment_type = "PROXY"
      iam = {}
      node_config = {
        min_node_count = null
        max_node_count = null
    }
}
}

instances = {
PREFIX_NAME-apigee-instance  = {
      region                        = "REGION_NAME"
      environments                  = ["PREFIX_NAME-env"]
      description                   = "Apigee X Instance"
      consumer_accept_list          = ["HOST_PROJECT_ID"]
      disk_encryption_key           = null
      display_name                  = "PREFIX_NAME-apigee-instance"
    }
  }

service_accounts = {
  service_account_01 = {
    prefix       = "PREFIX_NAME"
    names        = ["apigee-mig-sa"]
    display_name = "PREFIX_NAME-apigee-bridge-mig-sa"
    description  = "Service Acount for Apigee Bridge Mig"
  }
}

mig_template = {
  name                 = "PREFIX_NAME-apigee-instance-template"
  machine_type         = "e2-micro"
  source_image_family  = "debian-11"
  source_image_project = "debian-cloud"
  target_size          = "2"
  source_image         = "debian-11-bullseye-v20230306"
  subnetwork           = "https://www.googleapis.com/compute/v1/projects/HOST_PROJECT_ID/regions/REGION_NAME/subnetworks/PREFIX_NAME-tenant-gke-us-ct1-subnet"
  network_tags        = ["allow-iap"]
  hostname            = "PREFIX_NAME-apigee-vm"
  mig_name            = "PREFIX_NAME-apigee-bridge-mig"
  health_check_name   = "PREFIX_NAME-apigee-mig-hc"
  health_check = {
    type                = "https"
    initial_delay_sec   = 30
    check_interval_sec  = 5
    healthy_threshold   = 2
    timeout_sec         = 5
    unhealthy_threshold = 2
    response            = ""
    port                = 443
    request             = ""
    proxy_header        = "NONE"
    request_path        = "/healthz/ingress"
  }
  named_ports = [{
     name = "https"
     port = 443
  }]
}

lb = {

  /** GLOBAL configuration **/
  region ="REGION_NAME"


  /** Network configuration **/
  apigee_ip= "apigee-lb-ext-ip"

  /** SSL configuration **/
  apigee_hosts = ["apigee-saas.PREFIX_NAME.FULL_ADMIN_DOMAIN"]
  apigee_ssl_cert  = "PREFIX_NAME-apigee-cert"
  port_range ="443"
  /** LB configuration **/
  lb_name = "apigee-bridge-lb"
  custom_labels_https_fwd_rule={
    project = "saas-admin-host"
    env     ="saas"
    region  = "REGION_NAME"
  }
  /** Prefix-name used for lb proxy and forwarding rule **/
  name = "apigee-bridge" 

  /** HealthCheck configuration **/
  hc_request_path = "/healthz/ingress"
  hc_port ="443"
}
