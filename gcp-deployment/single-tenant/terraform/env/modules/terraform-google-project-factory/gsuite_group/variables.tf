# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "domain" {
  type        = string
  description = "The domain name"
  default     = ""
}

variable "name" {
  type        = string
  description = "The name of the group."
  default     = ""
}

variable "org_id" {
  type        = string
  description = "The organization ID."
  default     = null
}

