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

variable "display_name" {
  description = "display name of uptime check"
  type        = string
  default     = null
}
variable "project" {
  description = "project id in which uptime check needs to be created"
  type        = string
}
variable "use_ssl" {
  description = "put true if https service is there else false"
  type        = bool
}
variable "validate_ssl" {
  description = "put true if https service is there else false"
  type        = bool
}
variable "host" {
  description = "domain name or the host IP address"
  type        = string
}
variable "path" {
  description = "directed path for which uptime check needs to be created"
  type        = string
}
variable "port" {
  description = "port used for the service"
  type        = string
}
variable "type" {
  description = "type of the target"
  type        = string
}
variable "timeout" {
  description = "for how much time error status should wait to get triggered"
  type        = string
  default     = null
}
variable "period" {
  description = "duration of uptime check"
  type        = string
  default     = null
}


