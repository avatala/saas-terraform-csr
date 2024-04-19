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
 
variable "service_project_prefix_path" {
 description = "The Terraform state bucket prefix path for the service Project ID."
 type        = string
 default     = ""
}

variable "host_project_prefix_path" {
 description = "The Terraform state bucket prefix path for the host Project ID."
 type        = string
 default     = ""
}

variable "service_accounts" {
  description = "The details of the service accounts."
  type = map(object({
    prefix       = string,
    names        = list(string),
    display_name = string,
    description  = string
  }))
  default = {
    service_account = {
      prefix       = ""
      project_id       = ""
      names        = []
      display_name = ""
      description  = ""
    }
  }
}

variable "anthos_hub_service_accounts" {
  description = "The details of the service accounts."
  type = map(object({
    prefix       = string,
    names        = list(string),
    display_name = string,
    description  = string
  }))
  default = {
    service_account = {
      prefix       = ""
      project_id       = ""
      names        = []
      display_name = ""
      description  = ""
    }
  }
}

variable "host_service_accounts" {
  description = "The details of the service accounts."
  type = map(object({
    prefix       = string,
    names        = list(string),
    display_name = string,
    description  = string
  }))
  default = {
    service_account = {
      prefix       = ""
      project_id       = ""
      names        = []
      display_name = ""
      description  = ""
    }
  }
}