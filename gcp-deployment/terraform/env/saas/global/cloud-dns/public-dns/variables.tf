# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


variable "dns_public_zones" {
  description = "The details of the Cloud DNS public zones."
  type = map(object({
    name        = string,
    description = string,
    domain      = string,
    labels      = map(string)
  }))
  default = {
    dns_public_zone = {
      name        = ""
      description = ""
      domain      = ""
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