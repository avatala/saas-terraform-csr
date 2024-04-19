# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "service_account_address" {
  description = "Service account address"
  type        = string
}

variable "project_id" {
  description = "Project id"
  type        = string
}

variable "project_roles" {
  description = "List of IAM roles"
  type        = list(string)
}
