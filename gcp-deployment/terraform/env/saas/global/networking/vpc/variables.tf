# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_state_bucket" {
 description = "The Terraform state bucket name for the Project ID."
 type        = string
 default     = ""
}

variable "host_project_prefix_path" {
 description = "The Terraform state bucket prefix path for the Project IDs."
 type        = string
 default     = ""
}

variable "project_name_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}

variable "anthos_hub_vpc" {
  description = "The details of shared vpc"
  type = map(object({
    description  = string
    network_name = string
    routing_mode = string

  }))
  default = {
    "shared-vpc" = {
      description  = ""
      network_name = ""
      routing_mode = ""
    }
  }
}

variable "apigee-admin-pool-vpc" {
  description = "The details of shared vpc"
  type = map(object({
    pool_vpc_description = string
    pool_routing_mode    = string
    pool_network_name    = string
  }))
  default = {
    "shared-vpc" = {
      pool_vpc_description = ""
      pool_routing_mode    = ""
      pool_network_name    = ""
    }
  }
}