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
network_state_bucket = "TF_BUCKET_NAME"
network_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/global/networking/vpc"

/******************************************
Firewall rule Details
*****************************************/

lb_type = "LOADBALANCER_TYPE"
application_port = ["APP_PORT"]

main_vpc_firewall_rules = [
  {
    name                    = "PREFIX_NAME-main-vpc-iap-allow-rule"
    description             = "This firewall rule is to allow GCP Cloud IAP IP ranges."
    direction               = "INGRESS"
    priority                = 1000
    ranges                  = ["35.235.240.0/20"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = ["allow-iap"]
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny       = []
    log_config = null
  },
  {
    name                    = "PREFIX_NAME-main-vpc-all-deny-rule"
    description             = "This firewall will deny all ingress traffic from internet."
    direction               = "INGRESS"
    priority                = 64000
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    deny = [{
      protocol = "all"
      ports    = []
    }]
    allow      = []
    log_config = null
  },
  {
    name                    = "PREFIX_NAME-main-vpc-lb-hc-allow-rule"
    description             = "This firewall rule is to allow google cloud probers for loadbalancer healtchecks."
    direction               = "INGRESS"
    priority                = 1000
    ranges                  = ["35.191.0.0/16", "130.211.0.0/22", "209.85.152.0/22", "209.85.204.0/22"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["80", "443"]
    }]
    deny       = []
    log_config = null
  }
]