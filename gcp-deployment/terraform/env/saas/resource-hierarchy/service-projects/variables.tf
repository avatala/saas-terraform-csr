# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_state_bucket" {
  description = "The Terraform state bucket name for the Project IDs."
  type        = string
  default     = ""
}


variable "host_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project IDs."
  type        = string
  default     = ""
}

variable "default_network_tier" {
  description = "Default Network Service Tier for resources created in this project. If unset, the value will not be modified. See https://cloud.google.com/network-tiers/docs/using-network-service-tiers and https://cloud.google.com/network-tiers."
  type        = string
  default     = ""
}

variable "service_projects" {
  description = "The Project name, Billing Account and APIs list for the Service projects."
  type = map(object({
    project_name                   = string,
    billing_account                = string,
    folder_id                      = string,
    activate_apis                  = list(string),
    default_logging_retention_days = string,
    grant_services_network_role    = bool,
    labels                         = map(string),

  }))
  default = {
    service_project = {
      project_name                   = ""
      billing_account                = ""
      folder_id                      = ""
      activate_apis                  = []
      default_logging_retention_days = ""
      grant_services_network_role    = true
      labels                         = {}
    }
  }
}
