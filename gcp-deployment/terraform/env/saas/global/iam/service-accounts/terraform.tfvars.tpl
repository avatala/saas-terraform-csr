# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
Terraform remote state
*****************************************/
project_state_bucket = "TF_BUCKET_NAME"
service_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"
project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"
host_project_prefix_path = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

/******************************************
Service Account details
*****************************************/

service_accounts = {
  service_account_01 = {
    prefix       = "PREFIX_NAME"
    names        = ["gke-sa"]
    display_name = "PREFIX_NAME-gke-sa"
    description  = "Service Acount for GKE"
  }
  service_account_02 = {
    prefix       = "PREFIX_NAME"
    names        = ["cloudbuild-sa-1"]
    display_name = "PREFIX_NAME-cloudbuild-sa"
    description  = "Service Acount for IAM Binding"
  },
  service_account_03 = {
    prefix       = "PREFIX_NAME"
    names        = ["cloudbq-sa"]
    display_name = "PREFIX_NAME-cloudbq-sa"
    description  = "Service Acount for IAM Binding"
  },
  service_account_04 = {
    prefix       = "PREFIX_NAME"
    names        = ["cronjob"]
    display_name = "PREFIX_NAME-cronjob"
    description  = "Service Acount for workload identity"
  }
  service_account_05 = {
    prefix       = "PREFIX_NAME"
    names        = ["cloud-deploy-sa"]
    display_name = "PREFIX_NAME-cloud-deploy-sa"
    description  = "Service Acount for Cloud deploy"
  }
}

anthos_hub_service_accounts = {
  anthos_hub_service_accounts01 = {
    prefix       = "PREFIX_NAME"
    names        = ["gke-hub-svc-agnt"]
    display_name = "PREFIX_NAME-gke-hub-svc-agnt"
    description  = "Service Acount for gke hub"
  },
  anthos_hub_service_accounts02 = {
    prefix       = "PREFIX_NAME"
    names        = ["anthos-acm-sa"]
    display_name = "PREFIX_NAME-anthos-acm-sa"
    description  = "Service Acount for anthos acm"
  }
}

host_service_accounts = {
  host_service_account_01 = {
    prefix       = "PREFIX_NAME"
    names        = ["mig-sa"]
    display_name = "PREFIX_NAME-mig-sa"
    description  = "Service Acount for IAM Binding"
  },
  host_service_account_02 = {
    prefix       = "PREFIX_NAME"
    names        = ["cloudrun-sa"]
    display_name = "PREFIX_NAME-cloudrun-sa"
    description  = "Service Acount for IAM Binding"
  },
  host_service_account_03 = {
    prefix       = "PREFIX_NAME"
    names        = ["cloudbq-sa"]
    display_name = "PREFIX_NAME-cloudbq-sa"
    description  = "Service Acount for IAM Binding"
  },
  host_service_account_04 = {
    prefix       = "PREFIX_NAME"
    names        = ["gcip-sa"]
    display_name = "PREFIX_NAME-gcip-sa"
    description  = "Service Acount for GCIP"
  }
}