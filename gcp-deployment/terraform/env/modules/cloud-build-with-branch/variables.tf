# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "name" {
  description = "Name of the trigger. Must be unique within the project"
}

variable "disabled" {
  description = "If true , the build is disabled"
}

variable "service_account" {
  description = "Name of the trigger. Must be unique within the project"
}

variable "project_id" {
  description = "ID of the project that owns the Cloud Source Repository."
  type        = string
}

variable "uri" {
  description = "Name of the Cloud Source Repository"
}

variable "path" {
  description = "Directory, relative to the source root, in which to run the build"
}

variable "branch" {
  description = "Name of the branch to build"
}


variable "substitutions" {
  description = "environment variable"
  type = map(string)
}

variable "location" {
  type = string
}

