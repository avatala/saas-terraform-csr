# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  description = "The project ID to create the resources in."
  type        = string
}

variable "name" {
  description = "Name for the load balancer forwarding rule and prefix for supporting resources."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL MODULE PARAMETERS
# These variables have defaults, but may be overridden by the operator.
# ---------------------------------------------------------------------------------------------------------------------
# variable "enable_ssl" {
#   description = "Set to true to enable ssl. If set to 'true', you will also have to provide 'var.ssl_certificates'."
#   type        = bool
#   default     = false
# }

# variable "create_dns_entries" {
#   description = "If set to true, create a DNS A Record in Cloud DNS for each domain specified in 'custom_domain_names'."
#   type        = bool
#   default     = false
# }

# variable "custom_domain_names" {
#   type        = string
#   description = "Custom Domain Name"
# }


# variable "custom_domain_names1" {
#   type        = string
#   description = "Custom Domain Name"
# }


# variable "dns_managed_zone_name" {
#   description = "The name of the Cloud DNS Managed Zone in which to create the DNS A Records specified in 'var.custom_domain_names'. Only used if 'var.create_dns_entries' is true."
#   type        = string
#   default     = "replace-me"
# }

# variable "dns_managed_zone_name1" {
#   description = "The name of the Cloud DNS Managed Zone in which to create the DNS A Records specified in 'var.custom_domain_names'. Only used if 'var.create_dns_entries' is true."
#   type        = string
#   default     = "replace-me"
# }

# variable "dns_record_ttl" {
#   description = "The time-to-live for the site A records (seconds)"
#   type        = number
#   default     = 300
# }

variable "custom_labels" {
  description = "A map of custom labels to apply to the resources. The key is the label name and the value is the label value."
  type        = map(string)
  default     = {}
}

# variable "freemium_static_ip"{
#   type        = string
#   description = "Name of the external-ip. the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])?"
# }

# variable "enterprise_static_ip"{
#   type        = string
#   description = "Name of the external-ip. the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])?"
# }

variable "apigee_static_ip"{
  type        = string
  description = "Name of the external-ip. the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])?"
}

variable "lb_name"{
  type        = string
  description = "Load Balabcer Name"
}
# variable "lb_name1"{
#   type        = string
#   description = "Load Balabcer Name"
# }

# variable "freemium_ssl_cert"{
#   type        = string
#   default     = "(Optional) Creates a unique name beginning with the specified prefix."
#   description = "SSL certificate name"
# }

# variable "enterprise_ssl_cert"{
#   type        = string
#   default     = "(Optional) Creates a unique name beginning with the specified prefix."
#   description = "SSL certificate name"
# }

variable "apigee_ssl_cert"{
  type        = string
  default     = "(Optional) Creates a unique name beginning with the specified prefix."
  description = "SSL certificate name"
}

# variable "freemium_hosts"{
#   type       = list(string)
#   description = "Domains for which a managed SSL certificate will be valid."
# }

# variable "enterprise_hosts"{
#   type       = list(string)
#   description = "Domains for which a managed SSL certificate will be valid."
# }

variable "apigee_hosts"{
  type       = list(string)
  description = "Domains for which a managed SSL certificate will be valid."
}

variable "port_range"{
  type       = number
  default    = 443
  description = "HTTPS Port number"
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


# variable "admin_backends" {
#     description = "Map backend indices to list of backend maps."
#     type = map(object({
#       description                     = string
#       protocol                        = string
#       port_name                       = string
#       port                            = number
#       timeout_sec                     = number
#       connection_draining_timeout_sec = number
#       session_affinity                = string
#       affinity_cookie_ttl_sec         = number

#       log_config = object({
#         enable      = bool
#         sample_rate = number
#       })
#       iap_config = object({
#       enable               = bool
#       oauth2_client_id     = string
#       oauth2_client_secret = string
#     })

      
#       groups = list(object({
#         group                        = string
#         balancing_mode               = string
#         capacity_scaler              = number
#         description                  = string
#         max_connections              = number
#         max_connections_per_instance = number
#         max_connections_per_endpoint = number
#         max_rate                     = number
#         max_rate_per_instance        = number
#         max_rate_per_endpoint        = number
#         max_utilization              = number
#       }))

#     }))
#   }

# variable "freemium_certificate_map" {
#   description = "ID of the certificate map"  
# }

# variable "enterprise_certificate_map" {
#   description = "ID of the certificate map"  
# }


variable "security_policy" {
  description = "The resource URL for the security policy to associate with the backend service"
  type        = string
  default     = null
}

# variable "nginx_https_redirect" {
#   description = "Set to `true` to enable https redirect on the lb."
#   type        = bool
#   default     = false
# }
# variable "enterprise_https_redirect" {
#   description = "Set to `true` to enable https redirect on the lb."
#   type        = bool
#   default     = false
# }

# variable "http_forward" {
#   description = "Set to `false` to disable HTTP port 80 forward"
#   type        = bool
#   default     = true
# }

# variable "https_redirect" {
#   type = bool
# }
