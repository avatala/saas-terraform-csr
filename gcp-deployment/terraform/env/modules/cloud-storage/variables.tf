# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "name" {
  description = "The name of the bucket."
  type        = string
}

variable "project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}

variable "location" {
  description = "The location of the bucket."
  type        = string
}

variable "storage_class" {
  description = "The Storage Class of the new bucket."
  type        = string
  default     = null
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the bucket."
  type        = map(string)
  default     = null
}


variable "uniform_bucket_level_access" {
  description = "Enables Uniform bucket-level access access to a bucket."
  type        = bool
  default     = true
}

variable "public_access_prevention" {
  description = "Prevents public access to a bucket."
  type        = string
  default     = "enforced"
}

variable "versioning" {
  description = "While set to true, versioning is fully enabled for this bucket."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects. If false, Terraform will fail to delete buckets which contain objects."
  type        = bool
  default     = false
}

variable "iam_members" {
  description = "The list of IAM members to grant permissions on the bucket."
  type = list(object({
    role   = string
    member = string
  }))
  default = []
}

variable "retention_policy" {
  description = "Configuration of the bucket's data retention policy for how long objects in the bucket should be retained."
  type = object({
    is_locked        = bool
    retention_period = number
  })
  default = null
}

variable "kms_key_path" {
  description = "A Cloud KMS key that will be used to encrypt objects inserted into this bucket"
  type = string
  default = null
}

# variable "encryption" {
#   description = "A Cloud KMS key that will be used to encrypt objects inserted into this bucket"
#   type = object({
#     default_kms_key_name = string
#   })
#   default = null
# }

variable "lifecycle_rule" {
  type = object({
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
}