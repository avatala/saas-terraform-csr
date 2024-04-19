# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

module "metrics_scope" {
    source             = "../../../../modules/custom-monitoring/metrics-scope"
    project_id         = var.host_project_id
    monitored_projects = var.monitored_projects
}