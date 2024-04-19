variable "application_name" {
  type        = string
  description = "Name of the application which will also be the name of the repo."
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