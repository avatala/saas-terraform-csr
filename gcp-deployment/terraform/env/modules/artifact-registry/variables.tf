# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "region_name" {
    description = "Name of the Region for deployment"
    type= string    
}

variable "repo_id" {
    description = "Name of the Repository for deployment"
    type= string    
}

variable "format_type" {
    description = "Name of the Format for deployment"
    type= string    
}

variable "project_id" {
    description = "Name of the Project ID"
    type = string
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the artifact registry"
  type        = map(string)
  default     = null
}

variable "description" {
  description = "A set of key/value label pairs to assign to the artifact registry"
  type        = string
  default     = "For Docker Images"
}