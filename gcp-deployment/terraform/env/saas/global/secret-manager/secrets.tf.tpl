# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

resource "random_password" "pass-webhook" {
  length  = 16
  special = false
}

locals {
    secret_manager={
        secret_manager_01={
            id = "PREFIX_NAME-secret-01"
            secret = "myuser"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_02={
            id = "PREFIX_NAME_FREEMIUM_SUB_DOMAIN"
            secret = "freemium.CUSTOMER_DOMAIN.PREFIX_NAME.ADMIN_DOMAIN_"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_03={
            id = "PREFIX_NAME_ENTERPRISE_SUB_DOMAIN"
            secret = "enterprise.CUSTOMER_DOMAIN.PREFIX_NAME.ADMIN_DOMAIN_"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_04={
            id = "PREFIX_NAME_ADMIN_DOMAIN"
            secret = "ADMIN_DOMAIN_"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_05={
            id = "PREFIX_NAME_FREEMIUM_TRIGGER_ID"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_multi_tenant_trigger.trigger_id
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_06={
            id = "PREFIX_NAME_FREEMIUM_TRIGGER_LOCATION"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_multi_tenant_trigger.trigger_location
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_07={
            id = "PREFIX_NAME_ENTERPRISE_TRIGGER_ID"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_single_tenant_trigger.trigger_id
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_08={
            id = "PREFIX_NAME_ENTERPRISE_TRIGGER_LOCATION"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_single_tenant_trigger.trigger_location
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_09={
            id = "PREFIX_NAME_FREEMIUM_DELETE_TRIGGER_ID"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_multi_tenant_destroy_trigger.trigger_id
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_10={
            id = "PREFIX_NAME_FREEMIUM_DELETE_TRIGGER_LOCATION"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_multi_tenant_destroy_trigger.trigger_location
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_11={
            id = "PREFIX_NAME_ENTERPRISE_DELETE_TRIGGER_ID"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_single_tenant_destroy_trigger.trigger_id
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_12={
            id = "PREFIX_NAME_ENTERPRISE_DELETE_TRIGGER_LOCATION"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_single_tenant_destroy_trigger.trigger_location
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_13={
            id = "PREFIX_NAME-SUBNET-IP"
            secret = "10.128.0.0/24"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_14={
            id = "PREFIX_NAME_FREEMIUM_PROJECT_ID"
            secret = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        }
        secret_manager_15={
            id = "PREFIX_NAME_FREEMIUM_UPDATE_TRIGGER_ID"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_multi_tenant_update_trigger.trigger_id
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        }
        secret_manager_16={
            id = "PREFIX_NAME_FREEMIUM_UPDATE_TRIGGER_LOCATION"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_multi_tenant_update_trigger.trigger_location
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        }
        secret_manager_17={
            id = "PREFIX_NAME_IDP_TRIGGER_ID"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_identity_platform_config_trigger.trigger_id
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        }
        secret_manager_18={
            id = "PREFIX_NAME_IDP_TRIGGER_LOCATION"
            secret = data.terraform_remote_state.cloud_build_triggers.outputs.cloud_build_triggers.cloud_build_main_branch_identity_platform_config_trigger.trigger_location
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_19={
            id = "PREFIX_NAME_PRE_REQ_REGION"
            secret = "REGION_NAME"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_20={
            id = "PREFIX_NAME_LOAD_BALANCER_TYPE"
            secret = "LOADBALANCER_TYPE"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_21={
            id = "PREFIX_NAME_SEED_PROJECT_ID"
            secret = "TEMP_SEED_PROJECT_ID"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_22={
            id = "PREFIX_NAME_HOST_PROJECT_ID"
            secret = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_23={
            id = "PREFIX_NAME_ANTHOS_PROJECT_ID"
            secret = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_24={
            id = "PREFIX_NAME-app-webhook-secret"
            secret = random_password.pass-webhook.result
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_25={
            id = "PREFIX_NAME_CLOUD_FUNCTION_URI"
            secret = "https://master-saas.CUSTOMER_DOMAIN.PREFIX_NAME.ADMIN_DOMAIN_"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_26={
            id = "PREFIX_NAME_EMAIL_VERIFICATION_URI"
	        secret = "https://email-saas.CUSTOMER_DOMAIN.PREFIX_NAME.ADMIN_DOMAIN_"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_27={
            id = "PREFIX_NAME_GCIP_LOGIN_URL"
            secret = "gcip-saas.CUSTOMER_DOMAIN.PREFIX_NAME.ADMIN_DOMAIN_"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_28={
            id = "HELM_REPO_NAME"
            secret = "mkothainfn"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_29={
            id = "HELM_REPO_ATKN"
	        secret = "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"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_30={
            id = "HELM_APP_VERSION"
	        secret = "v1.2.4"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        }
    }
}
