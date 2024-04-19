# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_id" {
  description = "The project where scheduled queries are created"
  type        = string
}

variable "queries" {
  description = "Data transfer configuration for creating scheduled queries"
  type        = list(any)
}

# variable "name" {
  
# }

# variable "location" {
  
# }

# variable "data_source_id" {
  
# }

# variable "schedule" {
  
# }

# variable "destination_dataset_id" {
  
# }

# variable "params" {
  
# }