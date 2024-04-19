# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "certificate_manager" {
  description = "certificate manager creation"
}

variable "public_dns_state_bucket" {
  description = "The Terraform state bucket name for the dns."
  type        = string
  default     = ""
}

variable "public_dns_prefix_path" {
  description = "The Terraform state bucket prefix path for the dns."
  type        = string
  default     = ""
}

variable "host_project_state_bucket" {
  description = "The Terraform state bucket name for the Project ID."
  type        = string
  default     = ""
}

variable "host_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}