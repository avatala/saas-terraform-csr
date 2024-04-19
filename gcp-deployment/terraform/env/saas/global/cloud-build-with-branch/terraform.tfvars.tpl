# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

seed_project_id = "TEMP_SEED_PROJECT_ID_"
service_project_state_bucket = "TF_BUCKET_NAME"
service_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"

cloud_build_triggers = {
cloud_build_main_branch_host_projects_trigger = {
  name        = "host-projects-PREFIX_NAME-trigger"
  description = "cloud build trigger for host projects"
  location    = "global"
  uri         = "CODE_REPOSITORY_NAME"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/resource-hierarchy/host-project/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_service_projects_trigger = {
  name        = "service-projects-PREFIX_NAME-trigger"
  description = "cloud build trigger for service projects"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/resource-hierarchy/service-projects/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                       "_KMS_KEY_PATH" = "CMEK_KEY_PATH"
                    }
},
cloud_build_main_branch_service_api_trigger = {
  name        = "service-api-PREFIX_NAME-trigger"
  description = "cloud build trigger for service api"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/service-api/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME" 
                    }
},
cloud_build_main_branch_service_iam_custom_roles_trigger = {
  name        = "iam-custom-roles-PREFIX_NAME-trigger"
  description = "cloud build trigger for iam custom roles"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/iam/custom-roles/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_service_iam_service_account_trigger = {
  name        = "iam-service-account-PREFIX_NAME-trigger"
  description = "cloud build trigger for iam service account"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/iam/service-accounts/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_service_iam_role_binding_trigger = {
  name        = "iam-role-binding-PREFIX_NAME-trigger"
  description = "cloud build trigger for iam service account"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/iam/iam-binding/member-iam-bindings/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_VENDOR_EMAIL_ID" = "VENDOR_EMAIL_ID_" 
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_gcs_trigger = {
  name        = "gcs-PREFIX_NAME-trigger"
  description = "cloud build trigger for gcs"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/gcs/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                       "_KMS_KEY_PATH" = "CMEK_KEY_PATH"
                    }
},
cloud_build_main_branch_shared_vpc_trigger = {
  name        = "shared-vpc-PREFIX_NAME-trigger"
  description = "cloud build trigger for shared vpc"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/networking/vpc/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_subnet_trigger = {
  name        = "subnet-PREFIX_NAME-trigger"
  description = "cloud build trigger for subnet"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/networking/subnets/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_firewall_rules_trigger = {
  name        = "firewall-rules-PREFIX_NAME-trigger"
  description = "cloud build trigger for firewall rules"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/networking/firewall-rules/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                       "_LB_TYPE"                  = "LOADBALANCER_TYPE"
                       "_APPLICATION_PORT"         = "APP_PORT"
                    }
},
cloud_build_main_branch_nat_gateway_trigger = {
  name        = "nat-gateway-PREFIX_NAME-trigger"
  description = "cloud build trigger for nat gateway"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/networking/nat-gateway/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TERRAFORM_CODE_BRANCH_NAME"="REPO_BRANCH_NAME"
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_cloud_armor_trigger = {
  name        = "cloud-armor-PREFIX_NAME-trigger"
  description = "cloud build trigger for cloud armor"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/cloud-armor/security-policy/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_cloud_vpn_trigger = {
  name        = "cloud-vpn-PREFIX_NAME-trigger"
  description = "cloud build trigger for cloud vpn"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/networking/cloud-vpn/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_private_service_access_trigger = {
  name        = "private-service-access-PREFIX_NAME-trigger"
  description = "cloud build trigger for private service access"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/networking/private-service-access/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_vpc_serverless_connect_trigger = {
name        = "vpc-serverless-connect-PREFIX_NAME-trigger"
description = "cloud build trigger for vpc serverless connect"
uri         = "CODE_REPOSITORY_NAME"
location    = "global"
branch      = "REPO_BRANCH_NAME"
path        = "gcp-deployment/terraform/env/saas/global/networking/vpc-serverless-connector/cloudbuild.yaml"
service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
substitutions   = {   "_REGION"                     = "REGION_NAME",
                      "_TFSTATE_GCS_BUCKET_NAME"    = "TF_BUCKET_NAME"
                      "_LOGS_GCS_BUCKET_NAME"       = "LOGS_BUCKET_NAME_"
                      "_PREFIX"                     = "PREFIX_NAME"
                      "_KMS_KEY_PATH"               = "CMEK_KEY_PATH"
                      "_BRANCH_NAME"                = "REPO_BRANCH_NAME"
                      "_ADMIN_DOMAIN"               = "ADMIN_DOMAIN_"
                      "_CSR_APP_REPO_NAME"          = "APP_REPO_NAME_"
                      "_TERRAFORM_CODE_BRANCH_NAME" = "REPO_BRANCH_NAME"
                      "_CSR_TERRAFORM_REPO_NAME"    = "CODE_REPOSITORY_NAME"
                  }
},
cloud_build_main_branch_cloud_function_trigger = {
  name        = "cloud-function-PREFIX_NAME-trigger"
  description = "cloud build trigger for cloud function"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/cloud-function/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"                 ="REGION_NAME",
                       "_TFSTATE_GCS_BUCKET_NAME" ="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME"    = "LOGS_BUCKET_NAME_"
                       "_PREFIX"                  = "PREFIX_NAME"
                       "_ADMIN_DOMAIN"            = "ADMIN_DOMAIN_"
                       "_BRANCH_NAME"             = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_cloud_function_email_verification_trigger = {
  name        = "cloud-function-email-verification-PREFIX_NAME-trigger"
  description = "cloud build trigger for cloud function email verification"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/cloud-function-email-verification/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"                     = "REGION_NAME",
                       "_TFSTATE_GCS_BUCKET_NAME"     = "TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME"        = "LOGS_BUCKET_NAME_"
                       "_PREFIX"                      = "PREFIX_NAME"
                       "_ADMIN_DOMAIN"                = "ADMIN_DOMAIN_"
                       "_BRANCH_NAME"                 = "REPO_BRANCH_NAME"
                       "_CSR_APP_REPO_NAME"           = "APP_REPO_NAME_"
                       "_TERRAFORM_CODE_BRANCH_NAME"  = "REPO_BRANCH_NAME"
                       "_CSR_TERRAFORM_REPO_NAME"     = "CODE_REPOSITORY_NAME"
                    }
},
cloud_build_main_branch_secret_manager_trigger = {
  name        = "secret-manager-PREFIX_NAME-trigger"
  description = "cloud build trigger for secret manager"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/secret-manager/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"                 ="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"   ="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"                    ="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME" ="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME"    = "LOGS_BUCKET_NAME_"
                       "_PREFIX"                  = "PREFIX_NAME"
                       "_ADMIN_DOMAIN"            = "ADMIN_DOMAIN_"
                       "_BRANCH_NAME"             = "REPO_BRANCH_NAME"
                       "_LB_TYPE"                 = "LOADBALANCER_TYPE"
                       "_KMS_KEY_PATH"            = "CMEK_KEY_PATH"
                       "_SUB_DOMAIN"              = "CUSTOMER_DOMAIN"
                    }
},
cloud_build_main_branch_google_api_key_trigger = {
  name        = "google-api-key-PREFIX_NAME-trigger"
  description = "cloud build trigger for google api key"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/google-api-key/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {  
                       "_TFSTATE_GCS_BUCKET_NAME" ="TF_BUCKET_NAME"
                       "_LOG_BUCKET_NAME"         = "LOGS_BUCKET_NAME_"
                       "_PREFIX"                  = "PREFIX_NAME"
                       "_BRANCH_NAME"             = "REPO_BRANCH_NAME"
                       "_REGION"                 ="REGION_NAME"
                    }
},
cloud_build_main_branch_private_cloud_dns_trigger = {
  name        = "private-cloud-dns-PREFIX_NAME-trigger"
  description = "cloud build trigger for private cloud dns"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/cloud-dns/private-dns/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"                 ="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"   ="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"                    ="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME" ="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME"    = "LOGS_BUCKET_NAME_"
                       "_PREFIX"                  = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_public_cloud_dns_trigger = {
  name        = "public-cloud-dns-PREFIX_NAME-trigger"
  description = "cloud build trigger for public cloud dns"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/cloud-dns/public-dns/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"                 ="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"   ="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"                    ="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME" ="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME"    = "LOGS_BUCKET_NAME_"
                       "_PREFIX"                  = "PREFIX_NAME" 
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_certificate_trigger = {
  name        = "certificate-PREFIX_NAME-trigger"
  description = "cloud build trigger for certificate"
  uri         = "CODE_REPOSITORY_NAME"
  branch      = "REPO_BRANCH_NAME"
  location    = "global"
  path        = "gcp-deployment/terraform/env/saas/global/certificates/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_TEMP_SEED_PROJECT_ID"   ="TEMP_SEED_PROJECT_ID_"
                        "_TFSTATE_GCS_BUCKET_NAME" ="TF_BUCKET_NAME"
                        "_LOGS_GCS_BUCKET_NAME"    = "LOGS_BUCKET_NAME_"
                        "_PREFIX"                  = "PREFIX_NAME"
                        "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_certificate_map_trigger = {
  name        = "certificate-map-PREFIX_NAME-trigger"
  description = "cloud build trigger for certificate map"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/certificate-map-entry/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_TEMP_SEED_PROJECT_ID"   ="TEMP_SEED_PROJECT_ID_"
                        "_TFSTATE_GCS_BUCKET_NAME" ="TF_BUCKET_NAME"
                        "_LOGS_GCS_BUCKET_NAME"    = "LOGS_BUCKET_NAME_"
                        "_PREFIX"                  = "PREFIX_NAME"
                        "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                        "_LB_TYPE"                  = "LOADBALANCER_TYPE"
                        "_SSL_PROXY"                = "SSL__PROXY"
                    }
},
cloud_build_main_branch_http_mig_trigger = {
  name        = "http-mig-PREFIX_NAME-trigger"
  description = "cloud build trigger for http mig"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/http-mig/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_TEMP_SEED_PROJECT_ID"     = "TEMP_SEED_PROJECT_ID_"
                        "_TFSTATE_GCS_BUCKET_NAME"  = "TF_BUCKET_NAME"
                        "_LOGS_GCS_BUCKET_NAME"     = "LOGS_BUCKET_NAME_"
                        "_PREFIX"                   = "PREFIX_NAME"
                        "_REGION"                   = "REGION_NAME"
                        "_BRANCH_NAME"              = "REPO_BRANCH_NAME"
                        "_LB_TYPE"                  = "LOADBALANCER_TYPE"
                        "_KMS_KEY_PATH"             = "CMEK_KEY_PATH"
                    }
},
cloud_build_main_branch_tcp_mig_trigger = {
  name        = "tcp-mig-PREFIX_NAME-trigger"
  description = "cloud build trigger for tcp mig"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/tcp-mig/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_TEMP_SEED_PROJECT_ID"     = "TEMP_SEED_PROJECT_ID_"
                        "_TFSTATE_GCS_BUCKET_NAME"  = "TF_BUCKET_NAME"
                        "_LOGS_GCS_BUCKET_NAME"     = "LOGS_BUCKET_NAME_"
                        "_PREFIX"                   = "PREFIX_NAME"
                        "_REGION"                   = "REGION_NAME"
                        "_BRANCH_NAME"              = "REPO_BRANCH_NAME"
                        "_LB_TYPE"                  = "LOADBALANCER_TYPE"
                        "_APPLICATION_PORT"         = "APP_PORT"
                        "_SSL_PROXY"                = "SSL__PROXY"
                    }
},
cloud_build_main_branch_admin_lb_trigger = {
  name        = "admin-lb-PREFIX_NAME-trigger"
  description = "cloud build trigger for admin lb"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/networking/admin-loadbalancer/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_TEMP_SEED_PROJECT_ID"     ="TEMP_SEED_PROJECT_ID_"
                        "_TFSTATE_GCS_BUCKET_NAME"  ="TF_BUCKET_NAME"
                        "_LOGS_GCS_BUCKET_NAME"     = "LOGS_BUCKET_NAME_"
                        "_PREFIX"                   = "PREFIX_NAME"
                        "_REGION"                   ="REGION_NAME"
                        "_BRANCH_NAME"              = "REPO_BRANCH_NAME"
                        "_LB_TYPE"                  = "LOADBALANCER_TYPE"
                    }
}
cloud_build_main_branch_nginx_lb_trigger = {
  name        = "nginx-http-lb-PREFIX_NAME-trigger"
  description = "cloud build trigger for nginx http lb"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/networking/https-loadbalancer/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_TEMP_SEED_PROJECT_ID"     ="TEMP_SEED_PROJECT_ID_"
                        "_TFSTATE_GCS_BUCKET_NAME"  ="TF_BUCKET_NAME"
                        "_LOGS_GCS_BUCKET_NAME"     = "LOGS_BUCKET_NAME_"
                        "_PREFIX"                   = "PREFIX_NAME"
                        "_REGION"                   ="REGION_NAME"
                        "_BRANCH_NAME"              = "REPO_BRANCH_NAME"
                        "_LB_TYPE"                  = "LOADBALANCER_TYPE"
                    }
},
cloud_build_main_branch_nginx_tcp_lb_trigger = {
  name        = "nginx-tcp-lb-PREFIX_NAME-trigger"
  description = "cloud build trigger for nginx tcp lb"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/networking/tcp-loadbalancer/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_TEMP_SEED_PROJECT_ID"     ="TEMP_SEED_PROJECT_ID_"
                        "_TFSTATE_GCS_BUCKET_NAME"  ="TF_BUCKET_NAME"
                        "_LOGS_GCS_BUCKET_NAME"     = "LOGS_BUCKET_NAME_"
                        "_PREFIX"                   = "PREFIX_NAME"
                        "_REGION"                   ="REGION_NAME"
                        "_BRANCH_NAME"              = "REPO_BRANCH_NAME"
                        "_LB_TYPE"                  = "LOADBALANCER_TYPE"
                        "_APPLICATION_PORT"         = "APP_PORT"
                    }
},

cloud_build_main_branch_nginx_ssl_proxy_lb_trigger = {
  name        = "nginx-ssl-proxy-lb-PREFIX_NAME-trigger"
  description = "cloud build trigger for nginx ssl proxy lb"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/networking/ssl-proxy-loadbalancer/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_TEMP_SEED_PROJECT_ID"     ="TEMP_SEED_PROJECT_ID_"
                        "_TFSTATE_GCS_BUCKET_NAME"  ="TF_BUCKET_NAME"
                        "_LOGS_GCS_BUCKET_NAME"     = "LOGS_BUCKET_NAME_"
                        "_PREFIX"                   = "PREFIX_NAME"
                        "_REGION"                   ="REGION_NAME"
                        "_BRANCH_NAME"              = "REPO_BRANCH_NAME"
                        "_LB_TYPE"                  = "LOADBALANCER_TYPE"
                        "_APPLICATION_PORT"         = "APP_PORT"
                    }
},

cloud_build_main_branch_cloud_sql_trigger = {
  name        = "cloud-sql-PREFIX_NAME-trigger"
  description = "cloud build trigger for cloud sql"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/cloudsql/postgresql/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_bigquery_trigger = {
  name        = "bigquery-PREFIX_NAME-trigger"
  description = "cloud build trigger for bigquery"
  uri         = "CODE_REPOSITORY_NAME"
  branch      = "REPO_BRANCH_NAME"
  location    = "global"
  path        = "gcp-deployment/terraform/env/saas/regions/cloud-bigquery/bigquery/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                       "_KMS_KEY_PATH" = "CMEK_KEY_PATH"
                    }
},
cloud_build_main_branch_bigquery_scheduled_queries_trigger = {
  name        = "schedule-query-PREFIX_NAME-trigger"
  description = "cloud build trigger for bigquery scheduled queries"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/cloud-bigquery/scheduled-queries/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {  "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                       "_REGION"                 ="REGION_NAME"
                    }
},
cloud_build_main_branch_firebase_app_trigger = {
  name        = "firebase-app-PREFIX_NAME-trigger"
  description = "cloud build trigger for firebase app"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/firebase_app/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {  "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                       "_VENDOR_EMAIL_ID" = "VENDOR_EMAIL_ID_"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                       "_REGION"      ="REGION_NAME"
                       "_KMS_KEY_PATH" = "CMEK_KEY_PATH"
                    }
},
cloud_build_main_branch_docker_build_trigger = {
  name        = "docker-build-PREFIX_NAME-trigger"
  description = "cloud build trigger for firebase app"
  uri         = "ADMIN_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {  
                       "_TERRAFORM_CODE_BRANCH_NAME"="REPO_BRANCH_NAME"  
                       "_CSR_TERRAFORM_REPO_NAME"="CODE_REPOSITORY_NAME"
                       "_CSR_APP_REPO_NAME"="APP_REPO_NAME_"
                       "_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"  
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME"   = "LOGS_BUCKET_NAME_"
                       "_PREFIX"                 = "PREFIX_NAME"
                       "_BRANCH_NAME"            = "REPO_BRANCH_NAME"
                       "_REGION"                 ="REGION_NAME"
                       "_LB_TYPE"                = "LOADBALANCER_TYPE"
                       "_APIGEE"                 = "APIGEE_REQUIRED"
                       "_KMS_KEY_PATH"           = "CMEK_KEY_PATH"
                    }
},
cloud_build_main_branch_cloud_run_trigger = {
  name        = "cloud-run-PREFIX_NAME-trigger"
  description = "cloud build trigger for cloud run"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/cloudrun/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                       "_KMS_KEY_PATH" = "CMEK_KEY_PATH"
                    }
},
cloud_build_main_branch_cloud_run_iap_trigger = {
  name        = "cloud-run-iap-PREFIX_NAME-trigger"
  description = "cloud build trigger for cloud run iap"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/cloudrun-iap/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                       "_KMS_KEY_PATH" = "CMEK_KEY_PATH"
                    }
},
cloud_build_main_branch_serverless_neg_trigger = {
  name        = "serverless-neg-PREFIX_NAME-trigger"
  description = "cloud build trigger for serverless neg"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/networking/serverless-neg/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                        "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                        "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                        "_PREFIX" = "PREFIX_NAME" 
                        "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                        "_LB_TYPE"                  = "LOADBALANCER_TYPE"
                        "_SSL_PROXY"                = "SSL__PROXY"
                    }
},
cloud_build_main_branch_gke_cluster_trigger = {
  name        = "gke-cluster-PREFIX_NAME-trigger"
  description = "cloud build trigger for gke cluster"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/gke-cluster/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                       "_KMS_KEY_PATH"           = "CMEK_KEY_PATH"
                    }
},
cloud_build_main_branch_worker_pool_trigger = {
  name        = "worker-pool-PREFIX_NAME-trigger"
  description = "cloud build trigger for workerpool"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/worker-pool/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME" 
                    }
},
cloud_build_main_branch_gke_asm_acm_trigger = {
  name        = "gke-asm-acm-PREFIX_NAME-trigger"
  description = "cloud build trigger for gke asm acm"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/gke-asm-acm/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                        "_TERRAFORM_CODE_BRANCH_NAME"="REPO_BRANCH_NAME"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                       "_APP_REPO_GCR_NAME" = "APP_REPO_NAME_"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                       "_LB_TYPE"     = "LOADBALANCER_TYPE"
                    }
},
cloud_build_main_branch_workload_identity_trigger = {
  name        = "workload-identity-PREFIX_NAME-trigger"
  description = "cloud build trigger for workload identity"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/workload-identity/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TERRAFORM_CODE_BRANCH_NAME"="REPO_BRANCH_NAME"
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                       "_CSR_TERRAFORM_REPO_NAME"="CODE_REPOSITORY_NAME"
                       "_CSR_APP_REPO_NAME"="APP_REPO_NAME_"
                    }
},
cloud_build_main_branch_multi_tenant_trigger = {
  name        = "multi-tenant-PREFIX_NAME-app-deploy"
  description = "cloud build trigger for multi tenant"
  uri         = "APP_REPO_NAME_"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/cloud-build-with-branch-template/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = { 
                            "_REGION"="REGION_NAME"
                            "_CSR_TERRAFORM_REPO_NAME"="CODE_REPOSITORY_NAME"
                            "_TF_STATE_BUCKET_NAME"="TF_BUCKET_NAME"
                            "_LOG_BUCKET_NAME"="LOGS_BUCKET_NAME_"
                            "_CSR_APP_REPO_NAME"="APP_REPO_NAME_"
                            "_PREFIX"="PREFIX_NAME"
                            "_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                            "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                            "_LB_TYPE"     = "LOADBALANCER_TYPE"
                            "_APIGEE" = "APIGEE_REQUIRED"
                            "_SSL_PROXY"                = "SSL__PROXY"
                            "_KMS_KEY_PATH"           = "CMEK_KEY_PATH" 
                    }
},
cloud_build_main_branch_multi_tenant_update_trigger = {
  name        = "multi-tenant-PREFIX_NAME-app-update"
  description = "cloud build trigger for updating multi tenancy"
  uri         = "APP_REPO_NAME_"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/tenant-update/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = { 
                            "_LOG_BUCKET_NAME"="LOGS_BUCKET_NAME_"
                            "_PREFIX"="PREFIX_NAME"
                    }
},
cloud_build_main_branch_single_tenant_trigger = {
  name        = "single-tenant-PREFIX_NAME-tenant-deploy"
  description = "cloud build trigger for single tenant"
  uri         = "CODE_REPOSITORY_NAME"
  branch      = "REPO_BRANCH_NAME"
  location    = "global"
  path        = "gcp-deployment/single-tenant/terraform/env/saas/global/cloud-build-with-branch-template/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {
                            "_CSR_TERRAFORM_REPO_NAME"    = "CODE_REPOSITORY_NAME"
                            "_TF_STATE_BUCKET_NAME"       = "TF_BUCKET_NAME"
                            "_LOG_BUCKET_NAME"            = "LOGS_BUCKET_NAME_"
                            "_CSR_APP_REPO_NAME"          = "APP_REPO_NAME_"
                            "_PREFIX"                     = "PREFIX_NAME"
                            "_SEED_PROJECT_ID"            = "TEMP_SEED_PROJECT_ID_"
                            "_BRANCH_NAME"                = "REPO_BRANCH_NAME"
                            "_LB_TYPE"                    = "LOADBALANCER_TYPE"
                            "_APIGEE"                     = "APIGEE_REQUIRED"
                            "_TERRAFORM_CODE_BRANCH_NAME" ="REPO_BRANCH_NAME"
                            "_VENDOR_EMAIL_ID"            = "VENDOR_EMAIL_ID_"
                            "_PRE_REQ_REGION"             = "PRE__REQ__REGION"
                            "_SSL_PROXY"                  = "SSL__PROXY"
                            "_KMS_KEY_PATH"               = "CMEK_KEY_PATH"
                    }
},
cloud_build_main_branch_single_tenant_destroy_trigger = {
  name        = "single-tenant-PREFIX_NAME-destroy-saas-trigger"
  description = "cloud build trigger for delete tenant"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "REGION_NAME"
  branch      = "REPO_BRANCH_NAME"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  path        = "gcp-deployment/single-tenant/terraform/env/saas/single-tenant-tenant-destroy/cloudbuild.yaml"
  substitutions   = {
                            "_CSR_TERRAFORM_REPO_NAME"  = "CODE_REPOSITORY_NAME"
                            "_LOG_BUCKET_NAME"          = "LOGS_BUCKET_NAME_"
                            "_PREFIX"                   = "PREFIX_NAME"
                            "_SEED_PROJECT_ID"          = "TEMP_SEED_PROJECT_ID_"
                            "_CSR_APP_REPO_NAME"        = "APP_REPO_NAME_"
                            "_BRANCH_NAME"              = "REPO_BRANCH_NAME"
                            "_PRE_REQ_REGION"           = "PRE__REQ__REGION"
                            "_LB_TYPE"                  = "LOADBALANCER_TYPE"
                            "_APIGEE" = "APIGEE_REQUIRED"
                    }
},
cloud_build_main_branch_multi_tenant_destroy_trigger = {
  name        = "multi-tenant-PREFIX_NAME-destroy-saas-trigger"
  description = "cloud build trigger for delete tenant"
  uri         = "APP_REPO_NAME_"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  path        = "gcp-deployment/terraform/env/saas/global/multi-tenant-tenant-destroy/cloudbuild.yaml"
  substitutions   = {
                            "_LOG_BUCKET_NAME"          = "LOGS_BUCKET_NAME_"
                            "_CSR_APP_REPO_NAME"        = "APP_REPO_NAME_"
                            "_PREFIX"                   = "PREFIX_NAME"
                            "_SEED_PROJECT_ID"          = "TEMP_SEED_PROJECT_ID_"
                            "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                            "_REGION"="REGION_NAME"
                    }
},
cloud_build_main_branch_metrics_scope_trigger = {
  name        = "metrics-scope-PREFIX_NAME-trigger"
  description = "cloud build trigger for metrics scope"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/custom-monitoring/metrics_scope/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {
                            "_TF_STATE_BUCKET_NAME"     = "TF_BUCKET_NAME"
                            "_LOG_BUCKET_NAME"          = "LOGS_BUCKET_NAME_"
                            "_PREFIX"                   = "PREFIX_NAME"
                            "_BRANCH_NAME"              = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_custom_dashboard_trigger = {
  name        = "custom-dashboard-PREFIX_NAME-trigger"
  description = "cloud build trigger for custom dashboard"
  uri         = "CODE_REPOSITORY_NAME"
  branch      = "REPO_BRANCH_NAME"
  location    = "global"
  path        = "gcp-deployment/terraform/env/saas/global/custom-monitoring/custom_dashboard/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {
                            "_TF_STATE_BUCKET_NAME"     = "TF_BUCKET_NAME"
                            "_LOG_BUCKET_NAME"          = "LOGS_BUCKET_NAME_"
                            "_PREFIX"                   = "PREFIX_NAME"
                            "_SEED_PROJECT_ID"          = "TEMP_SEED_PROJECT_ID_"
                            "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_firestore_database_trigger = {
  name        = "firestore-database-PREFIX_NAME-trigger"
  description = "cloud build trigger for firestore database."
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/global/firestore_database/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {
                            "_REGION"="REGION_NAME"
                            "_TFSTATE_GCS_BUCKET_NAME"     = "TF_BUCKET_NAME"
                            "_LOGS_GCS_BUCKET_NAME"          = "LOGS_BUCKET_NAME_"
                            "_PREFIX"                   = "PREFIX_NAME"
                            "_SEED_PROJECT_ID"          = "TEMP_SEED_PROJECT_ID_"
                            "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
},
cloud_build_main_branch_notification_channel_trigger = {
  name        = "notification-channel-PREFIX_NAME-trigger"
  description = "cloud build trigger for notification channel."
  uri         = "CODE_REPOSITORY_NAME"
  branch      = "REPO_BRANCH_NAME"
  location    = "global"
  path        = "gcp-deployment/terraform/env/saas/global/alerting/notification-channel/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {
                            "_REGION"="REGION_NAME"
                            "_TFSTATE_GCS_BUCKET_NAME"     = "TF_BUCKET_NAME"
                            "_LOGS_GCS_BUCKET_NAME"          = "LOGS_BUCKET_NAME_"
                            "_PREFIX"                   = "PREFIX_NAME"
                            "_SEED_PROJECT_ID"          = "TEMP_SEED_PROJECT_ID_"
                            "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                            "_VENDOR_EMAIL_ID" = "VENDOR_EMAIL_ID_"
                    }
},
cloud_build_main_branch_alert_policy_trigger = {
  name        = "alert-policy-PREFIX_NAME-trigger"
  description = "cloud build trigger for alert policy."
  uri         = "CODE_REPOSITORY_NAME"
  branch      = "REPO_BRANCH_NAME"
  location    = "global"
  path        = "gcp-deployment/terraform/env/saas/global/alerting/alert-policy/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {
                            "_REGION"="REGION_NAME"
                            "_TFSTATE_GCS_BUCKET_NAME"     = "TF_BUCKET_NAME"
                            "_LOGS_GCS_BUCKET_NAME"          = "LOGS_BUCKET_NAME_"
                            "_PREFIX"                   = "PREFIX_NAME"
                            "_SEED_PROJECT_ID"          = "TEMP_SEED_PROJECT_ID_"
                            "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                            "_VENDOR_EMAIL_ID" = "VENDOR_EMAIL_ID_"
                            "_LB_TYPE"                  = "LOADBALANCER_TYPE"
                            "_APIGEE" = "APIGEE_REQUIRED"
                            "_KMS_KEY_PATH" = "CMEK_KEY_PATH"
                    }
},
cloud_build_main_branch_cloud_function_before_signin = {
  name        = "cloud-function-before-signin-PREFIX_NAME-trigger"
  description = "cloud build trigger for cloud function before sign in"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/cloud-function-before-signin/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME" 
                    }
},
cloud_build_main_branch_identity_platform_config_trigger = {
  name        = "single-tenant-identity-platform-config-PREFIX_NAME-trigger"
  description = "cloud build trigger for identity platform config"
  uri         = "CODE_REPOSITORY_NAME"
  branch      = "REPO_BRANCH_NAME"
  location    = "global"
  path        = "gcp-deployment/single-tenant/terraform/env/saas/global/identity-platform-config-template/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_PREFIX"="PREFIX_NAME"
                        "_TF_STATE_BUCKET_NAME"="TF_BUCKET_NAME"
                        "_LOG_BUCKET_NAME"="LOGS_BUCKET_NAME_"
                        "_PRE_REQ_REGION"           = "PRE__REQ__REGION"
                    }
}
}

cloud_build_main_branch_apigee_trigger = {
  name        = "apigee-PREFIX_NAME-trigger"
  description = "cloud build trigger for apigee"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/apigee/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {   "_REGION"="REGION_NAME",
                        "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_ZONE"="ZONE_NAME"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
}

cloud_build_main_branch_apigee_components_trigger = {
  name        = "apigee-components-PREFIX_NAME-trigger"
  description = "cloud build trigger for apigee components"
  uri         = "CODE_REPOSITORY_NAME"
  location    = "global"
  branch      = "REPO_BRANCH_NAME"
  path        = "gcp-deployment/terraform/env/saas/regions/apigee-components/cloudbuild.yaml"
  service_account = "projects/TEMP_SEED_PROJECT_ID_/serviceAccounts/saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID_.iam.gserviceaccount.com"
  substitutions   = {  "_TEMP_SEED_PROJECT_ID"="TEMP_SEED_PROJECT_ID_"
                       "_TFSTATE_GCS_BUCKET_NAME"="TF_BUCKET_NAME"
                       "_LOGS_GCS_BUCKET_NAME" = "LOGS_BUCKET_NAME_"
                       "_PREFIX" = "PREFIX_NAME"
                       "_BRANCH_NAME" = "REPO_BRANCH_NAME"
                    }
}