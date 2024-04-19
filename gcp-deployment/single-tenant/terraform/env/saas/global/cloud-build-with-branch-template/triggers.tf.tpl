# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# ------------------------------------------------------------------------------
# Cloudbuild Trigger Variables
# ------------------------------------------------------------------------------

module "random_string" {
  source          = "../../../modules/random-string"
  lookup_resource = "${_CUSTOMER_NAME}"
}

locals {
apigee_enable = ${_APIGEE_REQUIRED}
cloud_build_triggers = {
cloud_build_main_branch_service_folder_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-service-folder-saas-trigger"
  description    = "cloud build trigger for single tenant service folder"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/resource-hierarchy/folder-hierarchy/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_service_project_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-service-project-saas-trigger"
  description    = "cloud build trigger for single tenant service project"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/resource-hierarchy/service-projects-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_ENTERPRISE_PROJECT_ID" = "${_ENTERPRISE_PROJECT_ID}"
    "_PREFIX"                = "${_PREFIX}"
    "_CUSTOMER_NAME"         = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME"       = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"           = "${_CUSTOMER_NAME}"
    "_LB_TYPE"               = "${_LB_TYPE}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
    "_KMS_KEY_PATH"   = "${_CMEK_KEY_PATH}"
  }
},
cloud_build_main_branch_service_account_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-service-account-saas-trigger"
  description    = "cloud build trigger for single tenant service account"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/iam/service-accounts-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_custom_roles_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-custom-roles-saas-trigger"
  description    = "cloud build trigger for single tenant custom roles"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/iam/custom-roles-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_iam_bindings_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-iam-bindings-saas-trigger"
  description    = "cloud build trigger for single tenant iam bindings"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/iam/iam-binding-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_VENDOR_EMAIL_ID" = "${_VENDOR_EMAIL_ID}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_subnet_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-subnet-saas-trigger"
  description    = "cloud build trigger for single tenant subnet"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/networking/subnets-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_apigee_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-apigee-saas-trigger"
  description    = "cloud build trigger for single tenant apigee"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/regions/apigee-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_mig_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-mig-saas-trigger"
  description    = "cloud build trigger for single tenant mig"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/regions/mig-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_APIGEE"          =  "${_APIGEE_REQUIRED}"
    "_KMS_KEY_PATH"    = "${_CMEK_KEY_PATH}"
  }
},
cloud_build_main_branch_backend_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-backend-saas-trigger"
  description    = "cloud build trigger for single tenant backend"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/networking/backend-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
    "_KMS_KEY_PATH"   = "${_CMEK_KEY_PATH}"
  }
},
cloud_build_main_branch_bigquery_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-bigquery-saas-trigger"
  description    = "cloud build trigger for single tenant bigquery"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/regions/cloud-bigquery/bigquery-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
    "_KMS_KEY_PATH"   = "${_CMEK_KEY_PATH}"
  }
},
cloud_build_main_branch_scheduled_queries_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-scheduled-query-saas-trigger"
  description    = "cloud build trigger for single tenant scheduled query"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/regions/cloud-bigquery/scheduled-queries-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_gke_cluster_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-gke-cluster-saas-trigger"
  description    = "cloud build trigger for single tenant gke cluster"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/regions/gke-cluster-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"            = "${_PREFIX}"
    "_PRE_REQ_REGION"    = "${_PRE_REQ_REGION}"
    "_CUSTOMER_NAME"     = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME"   = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"       = "${_CUSTOMER_NAME}"
    "_LB_TYPE"           = "${_LB_TYPE}"
    "_APIGEE"            =  "${_APIGEE_REQUIRED}"
    "_KMS_KEY_PATH"      = "${_CMEK_KEY_PATH}"
    "_ACCELERATOR_COUNT" = "${_ACCELERATOR_COUNT}"
    "_ACCELERATOR_TYPE"  = "${_ACCELERATOR_TYPE}"
  }
},
cloud_build_main_branch_gke_asm_acm_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-gke-asm-acm-saas-trigger"
  description    = "cloud build trigger for single tenant gke asm acm"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/regions/gke-asm-acm-template/cloudbuild.yaml"
  location       = "${_PRE_REQ_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_REGION"          = "${_REGION}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_workload_identity_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-workload-identity-saas-trigger"
  description    = "cloud build trigger for workload-identity"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/regions/workload-identity-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"                     = "${_PREFIX}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_CUSTOMER_NAME"              = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME"            = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"                = "${_CUSTOMER_NAME}"
    "_LB_TYPE"                    = "${_LB_TYPE}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_cloud_deploy_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-cloud-deploy-saas-trigger"
  description    = "cloud build trigger for single tenant cloud deploy"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/cloud-deploy/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"               = "${_PREFIX}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_CUSTOMER_NAME"        = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME"      = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"          = "${_CUSTOMER_NAME}"
    "_LB_TYPE"              = "${_LB_TYPE}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_helm_gcas_deploy_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-helm-gcas-deploy-saas-trigger"
  description    = "cloud build trigger for single tenant gcas deploy"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/app-deploy/src/charts/cert-cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"               = "${_PREFIX}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_CUSTOMER_NAME"        = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME"      = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"          = "${_CUSTOMER_NAME}"
    "_LB_TYPE"              = "${_LB_TYPE}"
    "_TENANT_ID"            = "${_TENANT_ID}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_helm_app_deploy_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-helm-app-deploy-saas-trigger"
  description    = "cloud build trigger for single tenant app deploy"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/app-deploy/src/charts/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"               = "${_PREFIX}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_CUSTOMER_NAME"        = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME"      = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"          = "${_CUSTOMER_NAME}"
    "_LB_TYPE"              = "${_LB_TYPE}"
    "_TENANT_ID"            = "${_TENANT_ID}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_github_repo_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-github-repo-saas-trigger"
  description    = "cloud build trigger for github-repository"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/github_repo/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"                     = "${_PREFIX}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_CUSTOMER_NAME"              = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME"            = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"                = "${_CUSTOMER_NAME}"
    "_LB_TYPE"                    = "${_LB_TYPE}"
    "_TERRAFORM_CODE_BRANCH_NAME" = "${_TERRAFORM_CODE_BRANCH_NAME}"
    "_APIGEE"                     =  "${_APIGEE_REQUIRED}"
    "_CSR_TERRAFORM_REPO_NAME"    =  "${_CSR_TERRAFORM_REPO_NAME}"
    "_KMS_KEY_PATH"   = "${_CMEK_KEY_PATH}"
  }
},
cloud_build_main_branch_single_tenant_deployment_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-deployment-saas-trigger"
  description    = "cloud build trigger for single tenant deployment"
  uri            = "${_CSR_APP_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "single-tenant-cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_REGION"          = "${_REGION}"
    "_PREFIX"          = "${_PREFIX}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
    "_KMS_KEY_PATH"   = "${_CMEK_KEY_PATH}"
  }
},
cloud_build_main_branch_single_tenant_tcp_deployment_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-tcp-deployment-saas-trigger"
  description    = "cloud build trigger for single tenant tcp deployment"
  uri            = "${_CSR_APP_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "single-tenant-tcp-cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_REGION"          = "${_REGION}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_PORT"            = "${_PORT}"
  }
},
cloud_build_main_branch_dns_mapping_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-dns-mapping-saas-trigger"
  description    = "cloud build trigger for dns mapping"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/dns-mapping-template/cloudbuild.yaml"
  location       = "${_PRE_REQ_REGION}"
  substitutions  = {
    "_REGION"          = "${_REGION}"
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_tcp_tenant_mapping_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-tcp-tenant-mapping-saas-trigger"
  description    = "cloud build trigger for tcp tenant mapping"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/tcp-tenant-mapping-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_REGION"          = "${_REGION}"
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_PORT"            = "${_PORT}"
  }
},
cloud_build_main_branch_iap_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-iap-saas-trigger"
  description    = "cloud build trigger for iap"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/tenant-iap-access-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_metrics_scope_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-metrics-scope-trigger"
  description    = "cloud build trigger for metrics scope"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/custom-monitoring/metrics_scope/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_custom_dashboard_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-custom-dashboard-trigger"
  description    = "cloud build trigger for custom dashboard"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/custom-monitoring/custom_dashboard/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          = "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
},
cloud_build_main_branch_secret_create_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-secret-create-saas-trigger"
  description    = "cloud build trigger for delete secret"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/secret-manager-template/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"                  =  "${_PREFIX}"
    "_CUSTOMER_NAME"           =  "${_CUSTOMER_NAME}"
    "_LOG_BUCKET_NAME"         =  "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"             =  "${_CUSTOMER_NAME}"
    "_CUSTOMER_EMAIL"          =  "${_CUSTOMER_EMAIL}"
    "_TENANT_ID"               =  "${_TENANT_ID}"
    "_MASTER_IP"               =  "${_MASTER_IP}"
    "_SUBNET_IP"               =  "${_SUBNET_IP}"
    "_POD_RANGE"               =  "${_POD_RANGE}"
    "_SVC_RANGE"               =  "${_SVC_RANGE}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_REGION"                  =  "${_REGION}"
    "_CSR_TERRAFORM_REPO_NAME" =  "${_CSR_TERRAFORM_REPO_NAME}"
    "_TF_STATE_BUCKET_NAME"    =  "${_TF_STATE_BUCKET_NAME}"
    "_CSR_APP_REPO_NAME"       =  "${_CSR_APP_REPO_NAME}"
    "_SEED_PROJECT_ID"         =  "${_SEED_PROJECT_ID}"
    "_MACHINE_TYPE"            =  "${_MACHINE_TYPE}"
    "_ZONE"                    =  "${_ZONE}"
    "_MIN_COUNT"               =  "${_MIN_COUNT}"
    "_MAX_COUNT"               =  "${_MAX_COUNT}"
    "_NODE_COUNT"              =  "${_NODE_COUNT}"
    "_ENTERPRISE_PROJECT_ID"   =  "${_ENTERPRISE_PROJECT_ID}"
    "_ENTERPRISE_FOLDER_NAME"  =  "saas-folder-${_CUSTOMER_NAME}-${module.random_string.random_string}"
    "_ORG_LOGO_URL"            =  "${_ORG_LOGO_URL}"
    "_LB_TYPE"                 = "${_LB_TYPE}"
    "_TENANT_DOMAIN"           = "${_TENANT_DOMAIN}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
    "_KMS_KEY_PATH"   = "${_CMEK_KEY_PATH}"
  }
},
cloud_build_main_branch_secret_destroy_trigger = {
  name           = "${_CUSTOMER_NAME}-single-tenant-secret-destroy-saas-trigger"
  description    = "cloud build trigger for delete secret"
  uri            = "${_CSR_TERRAFORM_REPO_NAME}"
  branch         = "${_CUSTOMER_NAME}"
  path           = "gcp-deployment/single-tenant/terraform/env/saas/global/secret-destroy/cloudbuild.yaml"
  location       = "${_REGION}"
  substitutions  = {
    "_PREFIX"          =   "${_PREFIX}"
    "_CUSTOMER_NAME"   = "${_CUSTOMER_NAME}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_BRANCH_NAME"     = "${_CUSTOMER_NAME}"
    "_LB_TYPE"         = "${_LB_TYPE}"
    "_REGION"          =  "${_REGION}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
}
}
cloud_build_main_branch_apigee_components_trigger = {
  name        = "${_CUSTOMER_NAME}-single-tenant-apigee-components-saas-trigger"
  description = "cloud build trigger for apigee components"
  uri         = "${_CSR_TERRAFORM_REPO_NAME}"
  location       = "${_PRE_REQ_REGION}"
  branch      = "${_CUSTOMER_NAME}"
  path        = "gcp-deployment/single-tenant/terraform/env/saas/regions/apigee-components/cloudbuild.yaml"
  substitutions   = {
    "_PREFIX" = "${_PREFIX}"
    "_LOG_BUCKET_NAME" = "${_LOG_BUCKET_NAME}"
    "_TF_STATE_BUCKET_NAME" = "${_TF_STATE_BUCKET_NAME}"
    "_BRANCH_NAME" = "${_CUSTOMER_NAME}"
    "_SEED_PROJECT_ID" = "${_SEED_PROJECT_ID}"
    "_CUSTOMER_NAME" = "${_CUSTOMER_NAME}"
    "_CUSTOMER_EMAIL" = "${_CUSTOMER_EMAIL}"
    "_REGION" = "${_REGION}"
    "_PRE_REQ_REGION"  = "${_PRE_REQ_REGION}"
    "_TENANT_ID" = "${_TENANT_ID}"
    "_ENTERPRISE_PROJECT_ID"   =  "${_ENTERPRISE_PROJECT_ID}"
    "_APIGEE"         =  "${_APIGEE_REQUIRED}"
  }
}
}