# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

resource "google_gke_hub_membership" "membership" {
  membership_id = var.cluster_name
  project    = var.hub_project_id
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/projects/${var.cluster_project_id}/locations/${var.region}/clusters/${var.cluster_name}"
    }
  }
   authority {
    issuer = "https://container.googleapis.com/v1/projects/${var.cluster_project_id}/locations/${var.region}/clusters/${var.cluster_name}"
  }
  provider = google-beta
}