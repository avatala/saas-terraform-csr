# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "dns_private_zones" {
  description = "The details of the Cloud DNS private zones."
  type = map(object({
    name        = string,
    description = string,
    domain      = string,
    recordsets = list(object({
      name    = string
      type    = string
      ttl     = number
      records = list(string)
    }))
    labels = map(string)
  }))
  default = {
    dns_private_zone = {
      name        = ""
      description = ""
      domain      = ""
      recordsets  = []
      labels      = {}
    }
  }
}

variable "project_state_bucket" {
  description = "The Terraform state bucket name for the Project ID."
  type        = string
  default     = ""
}

variable "host_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
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