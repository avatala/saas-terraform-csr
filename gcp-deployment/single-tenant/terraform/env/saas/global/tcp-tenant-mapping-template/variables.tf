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
 description = "The Terraform state bucket prefix path for the host Project IDs."
 type        = string
 default     = ""
}

variable "service_project_prefix_path" {
 description = "The Terraform state bucket prefix path for the service Project ID."
 type        = string
 default     = ""
}

variable "lb_prefix_path" {
  description = "The Terraform state bucket prefix path for the LB."
  type        = string
  default     = ""
}

variable "lb_state_bucket" {
  description = "The Terraform state bucket name for the LB."
  type        = string
  default     = ""
}

variable "dns_state_bucket" {
  description = "The Terraform state bucket name for the dns ID."
  type        = string
  default     = ""
}

variable "public_dns_prefix_path" {
  description = "The Terraform state bucket prefix path for the public dns ID."
  type        = string
  default     = ""
}