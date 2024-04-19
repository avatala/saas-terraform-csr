# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project" {
  description = "The project that the service account will be created in."
}

variable "role_id" {
  description = "The camel case role id to use for this role."
}

variable "permissions" {
  description = "The names of the permissions this role grants when bound in an IAM policy. "
}