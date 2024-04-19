# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


variable "hub_project_id" {
  description = "anthos service mesh host  project in which the cluster is going to register."
  type        = string
}

variable "cluster_name" {
  description = "name of the cluster"
}

variable "enable_policy_controller" {
  description = "Enables the installation of Policy Controller. If false, the rest of PolicyController fields take no effect"
  type        = bool
  default     = true
}
variable "template_library_installed" {
  description = "Installs the default template library along with Policy Controller"
  type        = bool
  default     = true
}
variable "referential_rules_enabled" {
  description = "Enables the ability to use Constraint Templates that reference to objects other than the object currently being evaluated"
  type        = bool
  default     = true
}
variable "sync_repo" {
  description = " The URL of the Git repository to use as the source of truth"
  type        = string
}
variable "sync_branch" {
  description = "The branch of the repository to sync from"
  type        = string
  default     = "master"
}

variable "sync_rev" {
  description = "The revision of the repository"
  type = string
  default = "HEAD"
}

variable "sync_wait_secs" {
  description = "sync wait sec for acm to sync with the repo"
  type = string
  default = "15"
}


variable "policy_dir" {
  description = "The path within the Git repository that represents the top level of the repo to sync"
  type        = string
}
variable "secret_type" {
  description = "Type of secret configured for access to the Git repo"
  type        = string
  default     = "token"
}

variable "source_format" {
  description = "Specifies whether the Config Sync Repo is in hierarchical or unstructured mode"
  type        = string
}

variable "gcp_service_account_email" {
  description = "service account for connect with worload identity"
  type        = string
}

variable "exemptable_namespaces" {
  type        = list(string)
  description = "The set of namespaces that are excluded from Policy Controller checks. Namespaces do not need to currently exist on the cluster"
  default     = []
}


# variable "acm_version" {
#   description = " Version of ACM installed"
#   type        = string
#   default     = "1.12.1"
# }