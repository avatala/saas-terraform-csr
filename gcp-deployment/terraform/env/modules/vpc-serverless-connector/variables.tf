# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_id" {
  type        = string
  description = "Project in which the vpc connector will be deployed."
}

variable "vpc_connectors" {
  type        = list(map(string))
  default     = []
  description = "List of VPC serverless connectors."
}

variable "network" {
  type        = string
  description = "Project in which the vpc connector will be deployed."
}


