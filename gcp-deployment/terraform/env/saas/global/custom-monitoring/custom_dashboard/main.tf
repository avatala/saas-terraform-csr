# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

module "custom-dashboard" {
    count               = length(var.dashboard_json_file)
    source              = "../../../../modules/custom-monitoring/custom-dashboard"
    project_id          = var.host_project_id
    dashboard_json_file = var.dashboard_json_file[count.index]
}
