# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

host_project_state_bucket    = "TF_BUCKET_NAME"
host_project_prefix_path   = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"
cloud_armor_state_bucket  = "TF_BUCKET_NAME"
cloud_armor_prefix_path    = "gcp-deployment/terraform/env/PREFIX_NAME/global/cloud-armor/security-policy"
neg_state_bucket          = "TF_BUCKET_NAME"
neg_prefix_path            = "gcp-deployment/terraform/env/PREFIX_NAME/global/networking/serverless-neg"
dns_state_bucket             = "TF_BUCKET_NAME"
public_dns_prefix_path       = "gcp-deployment/terraform/env/PREFIX_NAME/global/cloud-dns/public-dns"


lb = {

  /** GLOBAL configuration **/
  region ="REGION_NAME"
  
  enable_ssl    = true

  /** Network configuration **/
  admin_ip= "PREFIX_NAME-admin-ip"

  /** SSL configuration **/
  admin_hosts =["admin-saas.PREFIX_NAME.FULL_ADMIN_DOMAIN"]
  admin_ssl_cert  = "PREFIX_NAME-admin-cert"
  port_range ="443"
  /** LB configuration **/
  lb_name = "PREFIX_NAME-admin-lb"
  custom_labels_https_fwd_rule={
    project = "PREFIX_NAME-admin-host"
    env     ="saas"
    region  = "REGION_NAME"
  }
  /** Prefix-name used for lb proxy and forwarding rule **/
  name = "PREFIX_NAME-admin-lb" 

  /** IAP Configuration **/
  iap_oauth2_client_id = ""
  iap_oauth2_client_secret = ""


  /** HealthCheck configuration **/
  hc_request_path = "/health"
  hc_port ="80"
  
  http_forward = true
  freemium_https_redirect = true
  enterprise_https_redirect = true
  https_redirect = true
  nginx_https_redirect = true
}