# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# ------------------------------------------------------------------------------
# CREATE THE LOAD BALANCER
# ------------------------------------------------------------------------------
locals {
  admin_ip_cmd = <<-EOT
       gcloud dns record-sets  create --rrdatas=${module.lb.admin_lb_ip_address} admin-saas.PREFIX_NAME.FULL_ADMIN_DOMAIN --ttl=300 --type=A --zone=${data.terraform_remote_state.public_dns.outputs.dns_public_zones.dns_public_zone_03.name} --project ${data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]}
  EOT
}

module "lb" {
  source                     = "../../../../modules/terraform-google-admin-lb/"
  project                    = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  name                       = var.lb["name"]
  admin_ip                   = var.lb["admin_ip"]
  enable_ssl                 = var.lb["enable_ssl"]
  custom_labels              = var.lb["custom_labels_https_fwd_rule"]
  lb_name                    = var.lb["lb_name"]
  admin_ssl_cert             = var.lb["admin_ssl_cert"]
  admin_hosts                = var.lb["admin_hosts"]
  security_policy            = data.terraform_remote_state.cloud_armor.outputs.security_policies.id
  port_range                 = var.lb["port_range"]
  http_forward               = var.lb["http_forward"]
  https_redirect             = var.lb["https_redirect"]
  nginx_https_redirect       = var.lb["nginx_https_redirect"]

  admin_backends = {
    default = {
      description                     = null
      protocol                        = "HTTPS"
      port                            = null
      port_name                       = "http"
      timeout_sec                     = 30
      connection_draining_timeout_sec = 0
      enable_cdn                      = false
      session_affinity                = null
      affinity_cookie_ttl_sec         = null
      custom_request_headers          = null

      log_config = {
        enable      = false
        sample_rate = null
      }

      groups = [
        {
          group                        = data.terraform_remote_state.neg.outputs.admin-portal
          balancing_mode               = null
          capacity_scaler              = null
          description                  = null
          max_connections              = null
          max_connections_per_instance = null
          max_connections_per_endpoint = null
          max_rate                     = null
          max_rate_per_instance        = null
          max_rate_per_endpoint        = null
          max_utilization              = null
        }

      ]
      iap_config = {
        enable               = false
        oauth2_client_id     = ""
        oauth2_client_secret = ""
      }
    }
  }
}

resource "null_resource" "sleep" {
    
  provisioner "local-exec" {
    when    = create
    command = "sleep 120"
  }
  depends_on = [
    module.lb
  ]
}

resource "null_resource" "admin_ip" {
  triggers = merge({
    admin_ip_cmd = local.admin_ip_cmd
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.admin_ip_cmd
  }
  depends_on = [
    null_resource.sleep
  ]
}
