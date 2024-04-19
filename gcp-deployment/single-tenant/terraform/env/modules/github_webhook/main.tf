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
 
data "google_iam_policy" "wh-secv-access" {
  binding {
    role = "roles/secretmanager.secretAccessor"
    members = [
      "serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com",
    ]
  }
}

resource "google_secret_manager_secret_iam_policy" "policy" {
  project     = var.project_id
  secret_id   = var.secret_id
  policy_data = data.google_iam_policy.wh-secv-access.policy_data
}

resource "google_cloudbuild_trigger" "deploy-app" {
  name        = "${var.customer_name}-app-deploy-webhook-trigger"
  description = "Webhook to deploy the tenant manifests to gke"
  project     = var.project_id
  location    = var.pre_req_region 
  webhook_config {
    secret = var.secret_version_id
  }

  source_to_build {
    uri = "https://source.developers.google.com/p/${var.project_id}/r/${var.csr_terraform_repo_name}"
    ref = "refs/heads/${var.customer_name}"
    repo_type = "CLOUD_SOURCE_REPOSITORIES"
  }
  filename = var.webhook_trigger_path
  substitutions = {
    _REPO            = var.infra_repo_name
    _REF             = "${"$"}(body.ref)"
    _COMMIT_MSG      = "${"$"}(body.head_commit.message)"
    _PREFIX          = var.prefix
    _CUSTOMER_NAME   = var.customer_name
    _LOG_BUCKET_NAME = var.log_bucket_name
    _PRE_REQ_REGION  = var.pre_req_region
    _KMS_KEY_PATH    = var.kms_key_path
  }
  filter          = "(!_COMMIT_MSG.matches('IGNORE'))"
  service_account = var.service_account
  depends_on      = [google_secret_manager_secret_iam_policy.policy]
}

resource "github_repository_webhook" "gh-webhook" {
  provider   = github
  repository = "${var.infra_repo_name}"
  configuration {
    url          = "https://cloudbuild.googleapis.com/v1/projects/${var.project_id}/locations/${var.pre_req_region}/triggers/${google_cloudbuild_trigger.deploy-app.name}:webhook?key=${var.api_key}&secret=${var.secret_version_data}&trigger=${google_cloudbuild_trigger.deploy-app.name}&projectId=${var.project_id}"
    content_type = "json"
    insecure_ssl = false
  }
  active     = true
  events     = ["push"]
  depends_on = [google_cloudbuild_trigger.deploy-app]
}