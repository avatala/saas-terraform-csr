# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
variable "gcs_buckets" {
  type = list(object({
    name = string,
    retention_policy = object({
      is_locked        = bool
      retention_period = number
    })
    kms_key_path = string,
    lifecycle_rule = object({
      action = object({
        type          = string
        storage_class = string
      })
      condition = object({
        age                        = number
        created_before             = string
        with_state                 = string
        matches_storage_class      = list(string)
        num_newer_versions         = number
        custom_time_before         = string
        days_since_custom_time     = number
        days_since_noncurrent_time = number
        noncurrent_time_before     = string
      })
    })
    versioning               = bool
    public_access_prevention = string
  }))
  default = [{
    encryption               = null
    name                     = ""
    retention_policy         = null
    kms_key_path             = ""
    lifecycle_rule           = null
    versioning               = true
    public_access_prevention = ""
  }]
}

variable "project_state_bucket" {
  type        = string
  description = "Name of the state bucket of project"
}

variable "host_project_prefix_path" {
  type        = string
  description = "Prefix of backend bucket where state file is stored"
}