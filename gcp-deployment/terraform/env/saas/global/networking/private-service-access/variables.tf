# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "main_vpc_private_service_access" {
  description = "The details of the Private Service Access."
  type = map(object({
    name                    = string,
    address                 = string,
    prefix_length           = number,
    labels                  = map(string),
    reserved_peering_ranges = list(string)
  }))
  default = {
    main_vpc_private_service_access = {
      name                    = ""
      address                 = ""
      prefix_length           = 16
      labels                  = {}
      reserved_peering_ranges = []
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
