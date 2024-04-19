# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

project_state_bucket = "TF_BUCKET_NAME"

host_project_prefix_path = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

seed_project_id = "TEMP_SEED_PROJECT_ID"

firebase_app={
    firebase_app_01={
        display_name = "PREFIX_NAME-admin-host-firebase"
    }
}

user_managed_replication = {
    secret-kms-1 = [
      {
        location     = "REGION_NAME"
        kms_key_name = "KMS_KEY_PATH"
      },
    ]
}