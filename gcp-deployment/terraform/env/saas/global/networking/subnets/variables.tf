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


variable "network_state_bucket" {
  description = "The Terraform state bucket name for the Network Name."
  type        = string
  default     = ""
}

variable "network_prefix_path" {
  description = "The Terraform state bucket prefix path for the Network Name."
  type        = string
  default     = ""
}

variable "anthos_hub_subnets" {
  description = "The details of the subnets which will be created, the list of secondary ranges that will be used in some of the subnets."
  type = map(object({
    subnets      = list(map(string)),
    secondary_ranges = map(list(object({
      range_name    = string,
      ip_cidr_range = string
    })))
  }))
  default = {
    subnet = {
      network_name     = ""
      subnets          = []
      secondary_ranges = {}
    }
  }
}


variable "apigee_admin_subnets" {
  description = "The details of the subnets which will be created, the list of secondary ranges that will be used in some of the subnets."
  type = map(object({
    subnets      = list(map(string)),
    secondary_ranges = map(list(object({
      range_name    = string,
      ip_cidr_range = string
    })))
  }))
  default = {
    subnet = {
      network_name     = ""
      subnets          = []
      secondary_ranges = {}
    }
  }
}
