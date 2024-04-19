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
       gcloud dns record-sets  create --rrdatas=${module.lb.admin_lb_ip_address} admin-saas.CUSTOMER_DOMAIN.PREFIX_NAME.FULL_ADMIN_DOMAIN --ttl=300 --type=A --zone=${data.terraform_remote_state.public_dns.outputs.dns_public_zones.dns_public_zone_03.name} --project ${data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]} && gcloud dns record-sets  create --rrdatas=${module.lb.email_verification_lb_ip_address} email-saas.CUSTOMER_DOMAIN.PREFIX_NAME.FULL_ADMIN_DOMAIN --ttl=300 --type=A --zone=${data.terraform_remote_state.public_dns.outputs.dns_public_zones.dns_public_zone_03.name} --project ${data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]} && gcloud dns record-sets  create --rrdatas=${module.lb.master_ip_address} master-saas.CUSTOMER_DOMAIN.PREFIX_NAME.FULL_ADMIN_DOMAIN --ttl=300 --type=A --zone=${data.terraform_remote_state.public_dns.outputs.dns_public_zones.dns_public_zone_03.name} --project ${data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]} && gcloud dns record-sets  create --rrdatas=${module.lb.gcip_ip_address} gcip-saas.CUSTOMER_DOMAIN.PREFIX_NAME.FULL_ADMIN_DOMAIN --ttl=300 --type=A --zone=${data.terraform_remote_state.public_dns.outputs.dns_public_zones.dns_public_zone_03.name} --project ${data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]}
  EOT
}

module "lb" {
  source                     = "../../../../modules/terraform-google-https-lb/"
  project                    = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  name                       = var.lb["name"]
  freemium_static_ip         = var.lb["freemium_static_ip"]
  enterprise_static_ip       = var.lb["enterprise_static_ip"]
  admin_ip                   = var.lb["admin_ip"]
  master_cf_ip               = var.lb["master_cf_ip"]
  email_verification_ip      = var.lb["email_verification_ip"]
  gcip_ip                    = var.lb["gcip_ip"]
  enable_ssl                 = var.lb["enable_ssl"]
  custom_labels              = var.lb["custom_labels_https_fwd_rule"]
  lb_name                    = var.lb["lb_name"]
  admin_ssl_cert             = var.lb["admin_ssl_cert"]
  email_verification_cert    = var.lb["email_verification_cert"]
  master_cf_cert             = var.lb["master_cf_cert"]
  gcip_cert                  = var.lb["gcip_cert"]
  admin_hosts                = var.lb["admin_hosts"]
  email_verification         = var.lb["email_verification"]
  master_cf                  = var.lb["master_cf"]
  gcip                       = var.lb["gcip"]
  security_policy            = data.terraform_remote_state.cloud_armor.outputs.security_policies.id
  port_range                 = var.lb["port_range"]
  http_forward               = var.lb["http_forward"]
  https_redirect             = var.lb["https_redirect"]
  nginx_https_redirect       = var.lb["nginx_https_redirect"]
  freemium_certificate_map   = data.terraform_remote_state.map_cert.outputs.freemium_map_id
  enterprise_certificate_map = data.terraform_remote_state.map_cert.outputs.enterprise_map_id
  backends = {
    default = {
      description                     = null
      protocol                        = "HTTP"
      port                            = 80
      port_name                       = "http"
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
        enable               = false
        oauth2_client_id     = var.lb["iap_oauth2_client_id"]
        oauth2_client_secret = var.lb["iap_oauth2_client_secret"]
      }

      groups = [
        {
          group                        = data.terraform_remote_state.mig.outputs.mig_self_link
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
    }
  }

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
    },
    master-cf = {
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
          group                        = data.terraform_remote_state.neg.outputs.master_cf
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
    },
    email-verification = {
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
          group                        = data.terraform_remote_state.neg.outputs.email_verification
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
    },
    gcip = {
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
          group                        = data.terraform_remote_state.neg.outputs.gcip
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
