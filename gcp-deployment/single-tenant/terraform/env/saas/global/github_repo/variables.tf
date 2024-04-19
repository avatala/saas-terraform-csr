variable "app_name" {
  type        = string
  description = "Name of the application which will also be the name of the repo."
}

variable "prefix" {
  type        = string
  description = "prefix"
}

variable "customer_name" {
  type        = string
  description = "Customer name"
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

variable "kms_key_path" {
  description = "The path of kms key"
  type        = string
}

variable "visibility" {
  type        = string
  description = "Enter public or private."
}

variable "has_issues" {
  type        = bool
  description = "Enable the GitHub Issues features on the repository."
}

variable "has_projects" {
  type        = bool
  description = "Enable the GitHub Projects features on the repository."
}

variable "has_wiki" {
  type        = bool
  description = "Enable the GitHub Wiki features on the repository."
}

variable "allow_merge_commit" {
  type        = bool
  description = "Disable or Enable merge commits on the repository."
}

variable "allow_squash_merge" {
  type        = bool
  description = "Disable or Enable squash merges on the repository."
}

variable "allow_rebase_merge" {
  type        = bool
  description = "Disable or Enable rebase merges on the repository."
}

variable "delete_branch_on_merge" {
  type        = bool
  description = "Automatically delete head branch after a pull request is merged."
}

variable "vulnerability_alerts" {
  type        = bool
  description = "Enable security alerts for vulnerable dependencies."
}

variable "project_number" {
  description = "Project number of the application admin project."
  type        = number
}

variable "project_id" {
  description = "Id of the application admin project."
  type        = string
}

variable "service_account" {
  description = "Service Account to associate Cloud Build trigger with."
  type        = string
}

variable "pre_req_region" {
  description = "pre-req region for infrastructure."
  type        = string
}

variable "project_state_bucket" {
  description = "GCS Storage bucket of project"
  type        = string
}

variable "api_key_prefix_path" {
  description = "The prefix path of api key for webhook trigger"
  type        = string
}

variable "secrets_prefix_path" {
  description = "The prefix path of secrets"
  type        = string
}