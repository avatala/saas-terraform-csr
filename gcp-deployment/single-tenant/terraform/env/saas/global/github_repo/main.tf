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
module "infrastructure_repo" {
  source                 = "../../../modules/github_repo"
  application_name       = var.app_name
  visibility             = var.visibility
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  vulnerability_alerts   = var.vulnerability_alerts
}

module "github_webhook" {
  source                  = "../../../modules/github_webhook"
  project_number          = var.project_number
  app_name                = var.app_name
  infra_repo_name         = module.infrastructure_repo.infra_repo_name
  project_id              = var.project_id
  service_account         = var.service_account
  pre_req_region          = var.pre_req_region
  prefix                  = var.prefix
  customer_name           = var.customer_name
  log_bucket_name         = var.log_bucket_name
  csr_terraform_repo_name = var.csr_terraform_repo_name
  webhook_trigger_path    = var.webhook_trigger_path
  kms_key_path            = var.kms_key_path     
  api_key                 = data.terraform_remote_state.api_key.outputs.google_api_key
  secret_id               = data.terraform_remote_state.secret_manager.outputs.secret_manager.secret_manager_24.secret_id
  secret_version_id       = data.terraform_remote_state.secret_manager.outputs.secret_manager.secret_manager_24.secret_version_id
  secret_version_data     = data.terraform_remote_state.secret_manager.outputs.secret_manager.secret_manager_24.secret_version_data
  depends_on              = [module.infrastructure_repo]
}