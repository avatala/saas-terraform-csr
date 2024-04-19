# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
  default     = "temp-test-project"
}

variable "default_logging_retention_days" {
  description = "Logs will be retained by default for this amount of time, after which they will automatically be deleted. The minimum retention period is 1 day. If this value is set to zero at bucket creation time, the default time of 30 days will be used."
  type        = string
  default     = ""
}

variable "location" {
  description = "The location of the bucket."
  type        = string
  default     = "global"
}

variable "bucket_id" {
  description = "The name of the logging bucket. Logging automatically creates two log buckets: _Required and _Default."
  type        = string
  default     = "_Default"
}

variable "description" {
  description = "Describes this bucket."
  type        = string
  default     = ""
}