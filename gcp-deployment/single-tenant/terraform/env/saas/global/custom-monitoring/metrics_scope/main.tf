module "metrics_scope" {
    source             = "../../../../modules/custom-monitoring/metrics-scope"
    project_id         = var.host_project_id
    monitored_projects = var.monitored_projects
}