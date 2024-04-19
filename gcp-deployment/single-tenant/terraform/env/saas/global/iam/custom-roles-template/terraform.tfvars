# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
Terraform remote state
*****************************************/

project_state_bucket         = "${TF_STATE_BUCKET_NAME}"

service_project_prefix_path  = "gcp-deployment/terraform/env/single-tenant/resource-hierarchy/projects/${_CUSTOMER_NAME}-service-projects"

/******************************************
Service Account details
*****************************************/

custom_roles = {
  custom_roles_01 = {
    role_id       = "${_CUSTOMER_NAME}_saas_gke_role"
    permissions = [
      "compute.acceleratorTypes.get",
      "iam.serviceAccounts.actAs",
      "iam.serviceAccounts.get",
      "iam.serviceAccounts.list",
      "logging.logEntries.create",
      "monitoring.metricDescriptors.create",
      "monitoring.metricDescriptors.get",
      "monitoring.metricDescriptors.list",
      "monitoring.monitoredResourceDescriptors.get",
      "monitoring.monitoredResourceDescriptors.list",
      "monitoring.timeSeries.create",
      "resourcemanager.projects.get"
      ]
  }
}