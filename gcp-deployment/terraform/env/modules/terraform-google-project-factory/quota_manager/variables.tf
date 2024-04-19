# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_id" {
  description = "The GCP project where you want to manage the consumer quotas"
  type        = string
}

variable "consumer_quotas" {
  description = "The quotas configuration you want to override for the project."
  type = list(object({
    service = string,
    metric  = string,
    limit   = string,
    value   = string,
  }))
}
