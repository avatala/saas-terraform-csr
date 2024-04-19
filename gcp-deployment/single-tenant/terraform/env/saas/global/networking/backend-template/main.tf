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
  secret_manager = {
  secret_manager_01 = {
    id     = "${_CUSTOMER_NAME}-SINGLE_TENANT_IDP_SECRET"
    secret = "${module.tenant.tenant_id}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
      }
    }
  }
}

module "backend" {
  source                     = "../../../../modules/terraform-google-backend/"
  project                    = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  security_policy            = data.terraform_remote_state.cloud_armor.outputs.security_policies.id
  name                       = var.lb["name"]
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
}


module "tenant" {
  source      = "../../../../modules/terraform-idp-tenant"
  project_id  = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  tenant_name = var.tenant_name
}

module "secret_manager" {
  source     = "../../../../modules/terraform-google-secret-manager"
  for_each   = local.secret_manager
  project_id = "${_SEED_PROJECT_ID}"
  id         = each.value.id
  secret     = each.value.secret
  labels     = each.value.labels
  user_managed_replication = var.user_managed_replication
}