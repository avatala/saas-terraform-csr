# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


variable "project" {
  description = "The project ID to create the resources in."
  type        = string
}

variable "name" {
  description = "Name for the load balancer forwarding rule and prefix for supporting resources."
  type        = string
}

variable "security_policy" {
  description = "Cloud security policy for backend"
  type = string
}


variable "backends" {
    description = "Map backend indices to list of backend maps."
    type = map(object({
      description                     = string
      protocol                        = string
      port_name                       = string
      port                            = number
      timeout_sec                     = number
      connection_draining_timeout_sec = number
      session_affinity                = string
      locality_lb_policy              = string
      affinity_cookie_ttl_sec         = number
      health_check = object({
        check_interval_sec  = number
        timeout_sec         = number
        healthy_threshold   = number
        unhealthy_threshold = number
        request_path        = string
        port                = number
        host                = string
        logging             = bool
        proxy_header        = string
        response            = string
      })
      log_config = object({
        enable      = bool
        sample_rate = number
      })
      iap_config = object({
      enable               = bool
      oauth2_client_id     = string
      oauth2_client_secret = string
    })

      
      groups = list(object({
        group                        = string
        balancing_mode               = string
        capacity_scaler              = number
        description                  = string
        max_connections              = number
        max_connections_per_instance = number
        max_connections_per_endpoint = number
        max_rate                     = number
        max_rate_per_instance        = number
        max_rate_per_endpoint        = number
        max_utilization              = number
      }))

    }))
  }   