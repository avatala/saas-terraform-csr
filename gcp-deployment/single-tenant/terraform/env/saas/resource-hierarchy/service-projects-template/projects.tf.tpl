/******************************************
 Service Project Details
*****************************************/

locals {
service_projects = {
    service_project_01 = {
    project_name                   = "${_ENTERPRISE_PROJECT_ID}"
    folder_id                      = data.terraform_remote_state.tenant_folder_id.outputs.service_folder.service_folder_01.folder.folder_id
    activate_apis                  = ["binaryauthorization.googleapis.com","artifactregistry.googleapis.com","cloudtrace.googleapis.com","billingbudgets.googleapis.com","cloudbilling.googleapis.com","compute.googleapis.com", "iam.googleapis.com","storage.googleapis.com","container.googleapis.com", "connectgateway.googleapis.com", "meshconfig.googleapis.com", "mesh.googleapis.com", "gkehub.googleapis.com", "anthos.googleapis.com", "anthosconfigmanagement.googleapis.com", "anthosgke.googleapis.com", "gkeconnect.googleapis.com", "meshca.googleapis.com","bigquery.googleapis.com","bigquerydatatransfer.googleapis.com","identitytoolkit.googleapis.com","clouddeploy.googleapis.com"]
    default_logging_retention_days = 30
    grant_services_network_role    = false
    labels = {
      "purpose"               = "single-tenant"
      "environment"           = "dev"
      "createdby"             = "terraform"
      "type"                  = "service-project"
    }
    metadata = [
      {
        key   = "enable-oslogin"
        value = "TRUE"
      }
    ]
  }
}
}