# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
variable "mig_template" {
  description = "configuration of mig and template"
}

variable "service_project_state_bucket" {
  description = "The Terraform state bucket name for the Project ID."
  type        = string
  default     = ""
}

variable "service_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
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

variable "network_state_bucket" {
  description = "The Terraform state bucket name for the network"
  type        = string
  default     = ""
}

variable "network_prefix_path" {
  description = "The Terraform state bucket prefix path for the network"
  type        = string
  default     = ""
}

variable "gcs_state_bucket" {
  description = "The Terraform state bucket name for the GCS bucket"
  type        = string
  default     = ""
}

variable "gcs_prefix_path" {
  description = "The Terraform state bucket prefix path for the GCS bucket"
  type        = string
  default     = ""
}