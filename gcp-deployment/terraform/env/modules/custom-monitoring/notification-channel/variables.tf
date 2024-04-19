/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project" {
  description = "The name of the bucket."
  type        = string
}

variable "display_name" {
  description = "The ID of the project to create the bucket in."
  type        = string
}

variable "description" {
  description = "The location of the bucket."
  type        = string
}

variable "enabled" {
  description = "The Storage Class of the new bucket."
  type        = bool
  default     = null
}

variable "channel_type" {
  description = "A set of key/value label pairs to assign to the bucket."
  type        = string
  default     = null
}


variable "labels" {
  description = "Enables Bucket Policy Only access to a bucket."
  type        = map(string)
  default     = null
}
 
variable "user_labels" {
  description = "Enables Bucket Policy Only access to a bucket."
  type        = map(string)
  default     = null
}

