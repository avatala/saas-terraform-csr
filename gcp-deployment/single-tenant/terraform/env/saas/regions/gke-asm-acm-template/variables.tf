# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
## Cluster Variables ##
variable "region" {
  description = "The region to host the cluster in"
  type        = string
}

variable "channel" {
  description = "The channel to use for this ASM installation.Must be one of rapid, regular, or stable."
  type        = string
}

variable "project_state_bucket" {
  description = "The Terraform state bucket name for the Project ID."
  type        = string
}

variable "service_project_prefix_path" {
 description = "The Terraform state bucket prefix path for the Project ID."
 type        = string
 default     = ""
}

variable "anthos_project_prefix_path" {
 description = "The Terraform state bucket prefix path for the Project ID."
 type        = string
 default     = ""
}

variable "service_account_state_bucket" {
  description = "The Terraform state bucket name for the service account"
  type        = string
}

variable "service_account_prefix_path" {
  description = "The Terraform state bucket prefix path for the service account"
  type        = string
}

variable "gke_state_bucket" {
  description = "The Terraform state bucket name for the Project ID."
  type        = string
}

variable "gke_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
}


/* ACM CODE */


variable "sync_repo" {
  description = " The URL of the Git repository to use as the source of truth"
  type        = string
}
variable "sync_branch" {
  description = "The branch of the repository to sync from"
  type        = string
}

variable "policy_dir" {
  description = "The path within the Git repository that represents the top level of the repo to sync"
  type        = string
}
variable "secret_type" {
  description = "Type of secret configured for access to the Git repo"
  type        = string
}

variable "source_format" {
  description = "Specifies whether the Config Sync Repo is in hierarchical or unstructured mode"
  type        = string
}