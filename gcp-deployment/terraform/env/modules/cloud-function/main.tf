# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

#Cloud function creation
resource "google_cloudfunctions2_function" "function" {
  provider = google-beta
  project     = var.project_id
  name        = var.function_name
  location    = var.function_region
  description = var.function_description

  build_config {
    runtime     = var.runtime
    entry_point = var.entrypoint
    source {
      storage_source {
        bucket = var.bucket_name
        object = var.object_name
      }
    }
  }

  service_config {
    max_instance_count = var.max_instance_count
    min_instance_count = var.min_instance_count
    available_memory   = var.function_memory
    timeout_seconds    = var.function_timeout
    available_cpu      = var.available_cpu
    environment_variables = var.environment_variables
    vpc_connector                  = var.vpc_connector
    ingress_settings               = var.ingress_settings
    vpc_connector_egress_settings  = var.vpc_connector_egress_settings
    service_account_email          = var.service_account_email
  }

  timeouts {
    create = "20m"
    update = "2h"
    delete = "20m"
  }
}

resource "google_cloudfunctions2_function_iam_member" "invokers" {
  provider = google-beta
  # for_each       = toset(contains(keys(var.members), "invokers") ? var.members["invokers"] : [])
  location       = google_cloudfunctions2_function.function.location
  project        = google_cloudfunctions2_function.function.project
  cloud_function = google_cloudfunctions2_function.function.name
  role           = var.role
  member         = var.authentication
}
