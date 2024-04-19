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

variable "tenant_id_prefix_path" {
 description = "The Terraform state bucket prefix path for the tenant id."
 type        = string
 default     = ""
}

variable "client_id" {
  description = "OAuth client ID."
}

variable "client_secret" {
  description = "OAuth client secret."
}
