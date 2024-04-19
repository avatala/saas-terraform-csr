/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "app_name" {
  description = "Name of the application for which the trigger is being created."
  type        = string
}

variable "project_number" {
  description = "Project number of the application admin project."
  type        = number
}

variable "infra_repo_name" {
  description = "Name of the infra repo."
  type        = string
}

variable "project_id" {
  description = "Id of the application admin project."
  type        = string
}

variable "service_account" {
  description = "Service Account to associate Cloud Build trigger with."
  type        = string
}

variable "prefix" {
  type        = string
  description = "GitHub access Token"
}

variable "customer_name" {
  type        = string
  description = "Name of the organisation."
}

variable "pre_req_region" {
  description = "pre-req region for infrastructure."
  type        = string
}

variable "log_bucket_name" {
  description = "Name of the logs storage bucket."
  type        = string
}

variable "csr_terraform_repo_name" {
  description = "Name of the CSR terraform repository"
  type        = string
}

variable "webhook_trigger_path" {
  description = "Path of the webhook trigger cloudbuild file"
  type        = string
}

variable "api_key" {
  description = "Api key for webhook trigger"
  type        = string
}

variable "secret_id" {
  description = "The id of secrets"
  type        = string
}

variable "secret_version_id" {
  description = "The version id of secret"
  type        = string
}

variable "secret_version_data" {
  description = "The version data of secret"
  type        = string
}

variable "kms_key_path" {
  description = "The path of kms key"
  type        = string
}