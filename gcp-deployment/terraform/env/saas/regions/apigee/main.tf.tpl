# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/**************************************
      Apigee Terraform code
*******************************************/

locals {
  project_id = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  network_self_link = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_self_link"]
  network = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]
  apigee_ip_cmd = <<-EOT
       gcloud dns record-sets  create --rrdatas=${module.apigee-x-global-https-lb["PREFIX_NAME-apigee-instance"].apigee_bridge_mig_lb_ip_address} apigee-saas.PREFIX_NAME.FULL_ADMIN_DOMAIN --ttl=300 --type=A --zone=${data.terraform_remote_state.public_dns.outputs.dns_public_zones.dns_public_zone_03.name} --project ${data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]}
  EOT
}

module "apigee-project-apis" {
source = "../../../modules/service-api"
project_id  = local.project_id
enable_apis = var.enable_apis
activate_apis = [ "apigee.googleapis.com","cloudkms.googleapis.com","compute.googleapis.com","servicenetworking.googleapis.com" ]
}

module "apigee-x-core" {
source  = "../../../modules/custom-apigee"
project_id = local.project_id
organization = var.organization
authorized_network = local.network
envgroups = var.envgroups
environments = var.environments
instances = var.instances
depends_on = [
  module.apigee-project-apis
]
}

module "mig_service_account" {
  source       = "../../../modules/terraform-google-service-accounts"
  project_id   = local.project_id
  for_each     = var.service_accounts
  prefix       = each.value.prefix
  names        = each.value.names
  display_name = each.value.display_name
  description  = each.value.description
}

module "apigee-x-bridge-instance-template" {
source     = "../../../modules/terraform-google-instance_template"
for_each = var.instances
name       = var.mig_template["name"]
project_id = local.project_id
network    = local.network
subnetwork           = var.mig_template["subnetwork"]
machine_type         = var.mig_template["machine_type"]
source_image_project = var.mig_template["source_image_project"]
source_image_family  = var.mig_template["source_image_family"]
source_image         = var.mig_template["source_image"]
tags                 = var.mig_template["network_tags"]
metadata = {
    ENDPOINT           = module.apigee-x-core.instances[each.key].host
    startup-script-url = "gs://apigee-5g-saas/apigee-envoy-proxy-release/latest/conf/startup-script.sh"
  }
service_account = {
    email  = "PREFIX_NAME-apigee-mig-sa@${local.project_id}.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
depends_on = [
  module.mig_service_account,
  module.apigee-x-core
]
}

module "apigee-x-bridge-mig" {
source = "../../../modules/terraform-google-mig"
for_each = var.instances
mig_name            = var.mig_template["mig_name"]
project_id          = local.project_id
region              = each.value.region
instance_template   = module.apigee-x-bridge-instance-template[each.key].self_link
health_check_name   = var.mig_template["health_check_name"]
hostname            = var.mig_template["hostname"]
target_size         = var.mig_template["target_size"]
health_check        = var.mig_template["health_check"]
named_ports         = var.mig_template["named_ports"]
depends_on = [
 module.apigee-x-bridge-instance-template
]
}

module "apigee-x-global-https-lb" {
source = "../../../modules/apigee-custom-https-lb"
for_each = var.instances
project                    = local.project_id
name                       = var.lb["name"]
apigee_static_ip            = var.lb["apigee_ip"]
custom_labels              = var.lb["custom_labels_https_fwd_rule"]
lb_name                    = var.lb["lb_name"]
apigee_ssl_cert             = var.lb["apigee_ssl_cert"]
apigee_hosts                = var.lb["apigee_hosts"]
port_range                 = var.lb["port_range"]
backends = {
    apigee-backend = {
      description                     = null
      protocol                        = "HTTPS"
      port                            = 443
      port_name                       = "https"
      timeout_sec                     = 30
      connection_draining_timeout_sec = 300
      session_affinity                = null
      locality_lb_policy              = null
      affinity_cookie_ttl_sec         = null
      health_check = {
        check_interval_sec  = 5
        timeout_sec         = 1
        healthy_threshold   = 2
        unhealthy_threshold = 2
        request_path        = var.lb["hc_request_path"]
        port                = var.lb["hc_port"]
        host                = null
        logging             = false
        proxy_header        = "NONE"
        response            = null
      }
      log_config = {
        enable      = false
        sample_rate = null
      }
     iap_config = {
       enable = false
       oauth2_client_id     = null
       oauth2_client_secret = null
     }
  groups = [
        {
          group                        = module.apigee-x-bridge-mig[each.key].instance_group
          balancing_mode               = "UTILIZATION"
          capacity_scaler              = 1.0
          description                  = null
          max_connections              = null
          max_connections_per_instance = null
          max_connections_per_endpoint = null
          max_rate                     = null
          max_rate_per_instance        = null
          max_rate_per_endpoint        = null
          max_utilization              = 1
        }
      ]
  depends_on = [
   module.apigee-x-bridge-mig
   ]
    }
  }
}

resource "null_resource" "sleep" {
    
  provisioner "local-exec" {
    when    = create
    command = "sleep 120"
  }
  depends_on = [
    module.apigee-x-global-https-lb
  ]
}

resource "null_resource" "apigee_ip" {
  triggers = merge({
    apigee_ip_cmd = local.apigee_ip_cmd
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.apigee_ip_cmd
  }
  depends_on = [
    null_resource.sleep
  ]
}

