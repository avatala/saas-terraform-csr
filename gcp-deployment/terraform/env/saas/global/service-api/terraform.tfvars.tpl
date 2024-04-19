# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"  # STATE FILES STORED IN THIS PATH UNDER THE BUCKET SPECIFIED ABOVE"
service_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"


freemium-project-services = {
  project-service_01 = {
    activate_apis              = ["cloudtrace.googleapis.com","anthosgke.googleapis.com", "sourcerepo.googleapis.com", "servicenetworking.googleapis.com","connectgateway.googleapis.com","meshconfig.googleapis.com","mesh.googleapis.com","gkehub.googleapis.com","container.googleapis.com","anthos.googleapis.com","anthosconfigmanagement.googleapis.com","anthosgke.googleapis.com","gkeconnect.googleapis.com","meshca.googleapis.com","billingbudgets.googleapis.com","cloudbilling.googleapis.com","bigquerydatatransfer.googleapis.com","clouddeploy.googleapis.com"]
    disable_dependent_services = true
  }
}


anthos-hub-project-services = {
  project-service_01 = {
    activate_apis              = ["anthosgke.googleapis.com", "sourcerepo.googleapis.com", "servicenetworking.googleapis.com","connectgateway.googleapis.com","meshconfig.googleapis.com","mesh.googleapis.com","gkehub.googleapis.com","container.googleapis.com","anthos.googleapis.com","anthosconfigmanagement.googleapis.com","anthosgke.googleapis.com","gkeconnect.googleapis.com","meshca.googleapis.com","billingbudgets.googleapis.com","cloudbilling.googleapis.com","bigquerydatatransfer.googleapis.com"]
    disable_dependent_services = true
  }
}


admin-host-project-services = {
 project-service_01 = {
    activate_apis              = ["cloudbuild.googleapis.com","cloudbilling.googleapis.com","bigquerydatatransfer.googleapis.com", "binaryauthorization.googleapis.com"]
    disable_dependent_services = true
  }
}