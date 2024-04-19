# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
variable "freemium_certificate_manager_map" {
  description = "configuration of cerficate manager map"
}

variable "enterprise_certificate_manager_map" {
  description = "configuration of enterprise certificate manager map"
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

variable "certificates_state_bucket" {
  description = "The Terraform state bucket name for the certificates."
  type        = string
  default     = ""
}

variable "certificates_prefix_path" {
  description = "The Terraform state bucket prefix path for the certificates."
  type        = string
  default     = ""
}
