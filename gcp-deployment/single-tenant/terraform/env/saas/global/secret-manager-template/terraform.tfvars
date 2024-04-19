# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
user_managed_replication = {
    secret-kms-1 = [
      {
        location     = "${_REGION}"
        kms_key_name = "${_KMS_KEY_PATH}"
      },
    ]
}

secret_manager = {
  secret_manager_01 = {
    id     = "${_CUSTOMER_NAME}-CUSTOMER_NAME"
    secret = "${_CUSTOMER_NAME}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_02 = {
    id     = "${_CUSTOMER_NAME}-CUSTOMER_EMAIL"
    secret = "${_CUSTOMER_EMAIL}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_03 = {
    id     = "${_CUSTOMER_NAME}-CUSTOMER_FOLDER_NAME"
    secret = "${_ENTERPRISE_FOLDER_NAME}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_04 = {
    id     = "${_CUSTOMER_NAME}-TENANT_ID"
    secret = "${_TENANT_ID}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_05 = {
    id     = "${_CUSTOMER_NAME}-MASTER_IP"
    secret = "${_MASTER_IP}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_06 = {
    id     = "${_CUSTOMER_NAME}-SUBNET_IP"
    secret = "${_SUBNET_IP}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_07 = {
    id     = "${_CUSTOMER_NAME}-POD_RANGE"
    secret = "${_POD_RANGE}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_08 = {
    id     = "${_CUSTOMER_NAME}-SVC_RANGE"
    secret = "${_SVC_RANGE}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_09 = {
    id     = "${_CUSTOMER_NAME}-CUSTOMER_REGION"
    secret = "${_REGION}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_10 = {
    id     = "${_CUSTOMER_NAME}-CSR_TERRAFORM_REPO_NAME"
    secret = "${_CSR_TERRAFORM_REPO_NAME}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_11 = {
    id     = "${_CUSTOMER_NAME}-TF_STATE_BUCKET_NAME"
    secret = "${_TF_STATE_BUCKET_NAME}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_12 = {
    id     = "${_CUSTOMER_NAME}-LOG_BUCKET_NAME"
    secret = "${_LOG_BUCKET_NAME}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_13 = {
    id     = "${_CUSTOMER_NAME}-CSR_APP_REPO_NAME"
    secret = "${_CSR_APP_REPO_NAME}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_14 = {
    id     = "${_CUSTOMER_NAME}-SEED_PROJECT_ID"
    secret = "${_SEED_PROJECT_ID}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_15 = {
    id     = "${_CUSTOMER_NAME}-PREFIX"
    secret = "${_PREFIX}"
    labels = {
      organization = "saas"
      createdby    = "terraform"
    }
  },
  secret_manager_16 = {
  id     = "${_CUSTOMER_NAME}-MACHINE_TYPE"
  secret = "${_MACHINE_TYPE}"
  labels = {
    organization = "saas"
    createdby    = "terraform"
  }
  },
  secret_manager_17 = {
  id     = "${_CUSTOMER_NAME}-ZONE"
  secret = "${_ZONE}"
  labels = {
    organization = "saas"
    createdby    = "terraform"
  }
  },
  secret_manager_18 = {
  id     = "${_CUSTOMER_NAME}-MIN_COUNT"
  secret = "${_MIN_COUNT}"
  labels = {
    organization = "saas"
    createdby    = "terraform"
  }
  },
  secret_manager_19 = {
  id     = "${_CUSTOMER_NAME}-MAX_COUNT"
  secret = "${_MAX_COUNT}"
  labels = {
    organization = "saas"
    createdby    = "terraform"
  }
  },
  secret_manager_20 = {
  id     = "${_CUSTOMER_NAME}-NODE_COUNT"
  secret = "${_NODE_COUNT}"
  labels = {
    organization = "saas"
    createdby    = "terraform"
  }
  },
  secret_manager_21 = {
  id     = "${_CUSTOMER_NAME}-ENTERPRISE_PROJECT_ID"
  secret = "${_ENTERPRISE_PROJECT_ID}"
  labels = {
    organization = "saas"
    createdby    = "terraform"
  }
  },
  secret_manager_22 = {
  id     = "${_CUSTOMER_NAME}-ORG_LOGO_URL"
  secret = "${_ORG_LOGO_URL}"
  labels = {
    organization = "saas"
    createdby    = "terraform"
  }
  },
  secret_manager_23 = {
  id     = "${_CUSTOMER_NAME}-TENANT_DOMAIN"
  secret = "${_TENANT_DOMAIN}"
  labels = {
    organization = "saas"
    createdby    = "terraform"
  }
  }
}