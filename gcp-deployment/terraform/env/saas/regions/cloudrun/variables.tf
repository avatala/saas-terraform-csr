# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


/******************************************
  Cloud Run Details
 *****************************************/

variable "project_state_bucket" {
  type        = string
  description = "Name of the state bucket of project"
}

variable "host_project_prefix_path" {
  type        = string
  description = "Prefix of backend bucket where state file is stored"
}

variable "cloudrun_apps" {
  description = "The details of the Cloud Run."
  type = map(object({
    region_name = string
    cloudrun_service_config = object({
      service_name             = string,
      container_image          = string,
      service_account_name     = string,
      max_instances            = number,
      min_instances            = number,
      container_concurrency    = number,
      timeout_seconds          = number,
      traffic_percent          = number,
      container_label          = string,
      cloudrun_label           = string,
      cpu_limits               = string,
      memory_limits            = string,
      cpu_requests             = string,
      memory_requests          = string,
      binary_authorization     = string,
      kms_key_path             = string
    })
    container_port = number,
    ingress_type   = string,
    member         = string
  }))
  default = {
    cloudrun_app = {
      cloudrun_service_config = {
        cloudrun_label           = ""
        container_concurrency    = null
        container_image          = ""
        container_label          = ""
        cpu_limits               = ""
        cpu_requests             = ""
        max_instances            = null
        memory_limits            = ""
        memory_requests          = ""
        min_instances            = null
        service_account_name     = ""
        service_name             = ""
        timeout_seconds          = null
        traffic_percent          = null
        binary_authorization     = null
        kms_key_path             = null
      }
      container_port = null
      ingress_type   = ""
      member         = ""
      region_name    = ""
    }
  }
}