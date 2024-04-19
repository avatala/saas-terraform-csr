# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

cloud_functions = {
    cloud_function = {
        project_id                      = "HOST_PROJECT_ID"
        region                          = "REGION_NAME"
        runtime                         = "nodejs18"
        timeout_s                       = "60"
        available_memory_mb             = "128"
        ingress_settings                = "ALLOW_INTERNAL_ONLY"
        source_directory                = "script"
        entry_point                     = "beforeSignIn"
        cloud_function_name             = "PREFIX_NAME-before-signin"
        trigger_http                    = true
        service_account_email           = "PREFIX_NAME-cloudrun-sa@PREFIX_NAME-admin-host.iam.gserviceaccount.com"
        vpc_connector_egress_settings   = "ALL_TRAFFIC"
        vpc_connector                   = "projects/PREFIX_NAME-admin-host/locations/REGION_NAME/connectors/PREFIX_NAME-vpc-connect"
        labels                          = { "owner" = "saas"}
    }
}
