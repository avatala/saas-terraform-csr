# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

resource "google_gke_hub_feature_membership" "feature_member" {
  location   = "global"
  feature    = "configmanagement" #google_gke_hub_feature.feature.name
  project    = var.hub_project_id
  membership = var.cluster_name
  configmanagement {
    # version = var.acm_version
    config_sync {
      source_format = var.source_format
      git {
        gcp_service_account_email = var.secret_type == "gcpserviceaccount" ? var.gcp_service_account_email : null
        sync_repo   = var.sync_repo
        sync_branch = var.sync_branch
        policy_dir  = var.policy_dir
        secret_type = var.secret_type
	      sync_rev    = var.sync_rev
        sync_wait_secs = var.sync_wait_secs

      }
    }
    policy_controller {
      enabled                    = var.enable_policy_controller
      audit_interval_seconds     = 0 
      template_library_installed = var.template_library_installed
      referential_rules_enabled  = var.referential_rules_enabled
      exemptable_namespaces      = var.exemptable_namespaces
    }
  }
  provider   = google-beta

  # depends_on = [
  #   google_gke_hub_feature.feature
  # ]

}

