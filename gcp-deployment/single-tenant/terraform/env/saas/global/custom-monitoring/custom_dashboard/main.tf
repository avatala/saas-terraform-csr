module "custom-dashboard" {
    source              = "../../../../modules/custom-monitoring/custom-dashboard"
    project_id          = var.host_project_id
    dashboard_json_file = var.dashboard_json_file
}