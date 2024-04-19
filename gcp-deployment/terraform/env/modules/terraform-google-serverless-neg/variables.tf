# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
variable "name" {
    description = "name of the network endpoint group"
    type = string
}

variable "project" {
    description = "name of the project"
    type = string 
}

variable "region" {
    description = "region to deploy network endpoint group"
    type = string 
}

variable "cloud_run_service_name" {
  description = "cloud run service name deployed in the project"
  type = string
}