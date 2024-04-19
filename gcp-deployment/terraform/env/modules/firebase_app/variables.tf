# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
 
variable "project_id" {
  description = "The ID of the project to create the the firebase app"
  type        = string
}

variable "display_name" {
  description = "The name of the app"
}