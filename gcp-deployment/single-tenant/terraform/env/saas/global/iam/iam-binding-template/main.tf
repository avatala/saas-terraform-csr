# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Remote state for Project
 *****************************************/

data "terraform_remote_state" "service_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.service_project_prefix_path
 }
}

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.host_project_prefix_path
 }
}

data "terraform_remote_state" "anthos_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.anthos_project_prefix_path
 }
}

/******************************************
  Project IAM Binding Details
 *****************************************/

module "clouddeploy_iam_bindings" {
  source                  = "../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "${_CUSTOMER_NAME}-saas-clouddeploy-sa@${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]}.iam.gserviceaccount.com"
  project_id              = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  project_roles           = ["roles/clouddeploy.admin","roles/clouddeploy.jobRunner","roles/container.admin","roles/storage.admin","roles/iam.serviceAccountUser"]
}

module "gke_iam_bindings" {
  source                  = "../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "${_CUSTOMER_NAME}-saas-gke-sa@${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]}.iam.gserviceaccount.com"
  project_id              = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  project_roles           = ["projects/${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]}/roles/${_CUSTOMER_NAME}_saas_gke_role","roles/container.developer","roles/storage.admin","roles/bigquery.dataEditor","roles/bigquery.user","roles/logging.logWriter","roles/monitoring.metricWriter"]
}


module "gke_iam_bindings_frontend" {
  source                  = "../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "${_CUSTOMER_NAME}-saas-gke-sa@${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]}.iam.gserviceaccount.com"
  project_id              = "${SEED_PROJECT_ID}"
  project_roles           = ["roles/storage.admin","roles/artifactregistry.writer"]
}


module "bq_bindings" {
  source                  = "../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "${_CUSTOMER_NAME}-saas-cloudbq-sa@${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]}.iam.gserviceaccount.com"
  project_id              = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  project_roles           = ["roles/bigquery.admin","roles/bigquerydatatransfer.serviceAgent","roles/storage.admin","roles/resourcemanager.projectIamAdmin","roles/iam.serviceAccountTokenCreator","roles/iam.serviceAccountViewer"]
}

module "service_iam_bindings" {
  source                  = "../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "service-${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_number"]}@container-engine-robot.iam.gserviceaccount.com"
  project_id              =  data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  project_roles           =  ["roles/compute.networkAdmin", "roles/compute.admin", "roles/container.hostServiceAgentUser", "roles/iam.securityAdmin" ]
}


module "anthos_iam_bindings" {
  source                  = "../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "${_CUSTOMER_NAME}-saas-acm-sa@${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]}.iam.gserviceaccount.com"
  project_id              = "${SEED_PROJECT_ID}"
  project_roles           = ["roles/source.reader"]
}

module "cloudbq_iam_bindings" {
  source                  = "../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "${_CUSTOMER_NAME}-saas-cloudbq-sa@${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]}.iam.gserviceaccount.com"
  project_id              = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  project_roles           = ["roles/bigquery.admin","roles/bigquerydatatransfer.serviceAgent","roles/storage.admin","roles/resourcemanager.projectIamAdmin","roles/iam.serviceAccountTokenCreator"]
}

module "cloudbq_iam_bindings_seed" {
  source                  = "../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "${_CUSTOMER_NAME}-saas-cloudbq-sa@${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]}.iam.gserviceaccount.com"
  project_id              = "${SEED_PROJECT_ID}"
  project_roles           = ["roles/storage.admin","roles/iam.serviceAccountTokenCreator"]
}


module "seed_iam_bindings_cloudbuild_sa" {
  source                  = "../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "saas-cloudbuild-sa@${SEED_PROJECT_ID}.iam.gserviceaccount.com"
  project_id              = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  project_roles           = ["roles/storage.admin","roles/iam.serviceAccountUser","roles/iam.serviceAccountTokenCreator","roles/iam.serviceAccountViewer","roles/container.clusterAdmin", "roles/compute.networkUser", "roles/bigquery.user", "roles/monitoring.editor", "roles/iam.serviceAccountAdmin","roles/iam.roleAdmin"]
}

module "gke_cloudrun_sa" {
  source                  = "../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "${PREFIX}-cloudrun-sa@${data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]}.iam.gserviceaccount.com"
  project_id              = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  project_roles           = ["roles/container.serviceAgent"]
}

module "seed_cloudbuild_sa" {
  source                  = "../../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "saas-cloudbuild-sa@${SEED_PROJECT_ID}.iam.gserviceaccount.com"
  project_id              = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  project_roles           = ["roles/storage.admin","roles/iam.serviceAccountUser","roles/compute.admin","roles/container.clusterAdmin","roles/monitoring.admin","roles/iam.serviceAccountTokenCreator","roles/iam.roleAdmin","roles/iam.serviceAccountDeleter","roles/clouddeploy.admin"]
}

// added project to metric scope
resource "google_monitoring_monitored_project" "primary" {
  metrics_scope = data.terraform_remote_state.anthos_project_id.outputs.service_projects.service_project_01["project_id"]
  name          = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  depends_on = [
    module.seed_iam_bindings_cloudbuild_sa
  ]
}

module "user_anthos_hub_iam_bindings" {
  source   = "../../../../modules/terraform-google-iam/projects_iam/"
  projects = [data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]]
  mode     = "additive"
  bindings = {
    "roles/logging.viewer" = var.users
  }
}