# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_id" {
  description = "The ID of the project."
  type        = string
  default     = ""
}

variable "region" {
  description = "The region where firestore database will be created."
  type        = string
  default     = ""
}

