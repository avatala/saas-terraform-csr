# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
/******************************************
	serverless neg variables
 *****************************************/
variable "region" {
  description = "region to deploy network endpoint group"
  type = string 
}

variable "name" {
  description = "name of the cloud run"
  type = string 
}

variable "master_cf" {
  type = string 
  description = "Name of master CF NEG"
}

variable "email_verification" {
  type = string 
  description = "Name of email verification CF NEG"
}

variable "gcip" {
  type = string
  description = "Name of GCIP Cloud run NEG"
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

variable "cloud_run_state_bucket" {
  description = "The Terraform state bucket name for the cloud run."
  type        = string
  default     = ""
}

variable "cloud_run_prefix_path" {
  description = "The Terraform state bucket prefix path for the cloud run."
  type        = string
  default     = ""
}

variable "master_cf_cloud_run_service_name" {
  type = string
}

variable "email_verification_cloud_run_service_name" {
  type = string
}

variable "gcip_state_bucket" {
  description = "The Terraform state bucket name for the gcip"
  type        = string
  default     = ""
}

variable "gcip_prefix_path" {
  description = "The Terraform state bucket prefix path for the gcip"
  type        = string
  default     = ""
}