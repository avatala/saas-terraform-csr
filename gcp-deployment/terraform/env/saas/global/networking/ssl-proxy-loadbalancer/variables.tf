# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "lb" {
  description = "configuration of nginx load balancer"
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
variable "mig_state_bucket" {
  description = "The Terraform state bucket name for the mig."
  type        = string
  default     = ""
}

variable "mig_prefix_path" {
  description = "The Terraform state bucket prefix path for the mig."
  type        = string
  default     = ""
}

variable "map_cert_state_bucket" {
  description = "The Terraform state bucket name for the certificate map."
  type        = string
  default     = ""
}

variable "map_cert_prefix_path" {
  description = "The Terraform state bucket prefix path for the certificate map."
  type        = string
  default     = ""
}