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


variable "org_id" {
  type        = string
  description = "Id of the Organization under which the projects will be placed."
  default     = ""
}

variable "billing_id" {
  type        = string
  description = "Id of the billing under which the projects will be placed."
  default     = ""
}

variable "default_network_tier" {
  description = "Default Network Service Tier for resources created in this project. If unset, the value will not be modified. See https://cloud.google.com/network-tiers/docs/using-network-service-tiers and https://cloud.google.com/network-tiers."
  type        = string
  default     = ""
}

variable "tenant_folder_prefix_path" {
  type = string
  description = "prefix path of tenant folder"
}
