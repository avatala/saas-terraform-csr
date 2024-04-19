# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


# Create a slot for the secret in Secret Manager
resource "google_secret_manager_secret" "secret" {
  project   = var.project_id
  secret_id = var.id
  labels    = var.labels

  replication {
    # automatic = lookup(each.value, "automatic_replication", null) != null ? true : null
    dynamic "user_managed" {
      # for_each = lookup(var.user_managed_replication, each.key, null) != null ? [1] : []
      for_each = var.user_managed_replication
      content {
        dynamic "replicas" {
          # for_each = lookup(var.user_managed_replication, each.key, [])
          for_each = var.user_managed_replication
          content {
            location = replicas.value[0].location
            dynamic "customer_managed_encryption" {
              for_each = replicas.value[0].kms_key_name != "null" ? [replicas.value[0].kms_key_name] : []
              content {
                kms_key_name = customer_managed_encryption.value
              }
            }
          }
        }
      }
    }
  }
}
#   replication {
#     dynamic "user_managed" {
#       for_each = length(var.replication_locations) > 0 ? [1] : []
#       content {
#         dynamic "replicas" {
#           for_each = var.replication_locations
#           content {
#             location = replicas.value
#           }
#         }
#       }
#     }
#     automatic = length(var.replication_locations) > 0 ? null : true
#   }
# }

# Store actual secret as the latest version.
resource "google_secret_manager_secret_version" "secret" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.secret
}

