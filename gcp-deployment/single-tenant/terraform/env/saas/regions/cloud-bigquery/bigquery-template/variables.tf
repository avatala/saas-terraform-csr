# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_state_bucket" {
  description = "The Terraform state bucket name for the Project IDs."
  type        = string
  default     = ""
}

variable "service_project_prefix_path" {
 description = "The Terraform state bucket prefix path for the Project ID."
 type        = string
 default     = ""
}

variable "saas_bigquery_dataset" {
  description = "The details for Stage BQ for realtime reporting"
  type = map(object({
    dataset_id                 = string
    description                = string
    location                   = string
    delete_contents_on_destroy = bool
    dataset_labels             = map(string)
    encryption_key             = string
  }))
  default = {
    bigquery = {
      dataset_id                 = ""
      description                = ""
      location                   = "asia-south1"
      delete_contents_on_destroy = false
      dataset_labels             = {}
      encryption_key             = "null"
    }
  }
}