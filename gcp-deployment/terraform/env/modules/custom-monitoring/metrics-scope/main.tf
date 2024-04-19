locals {
  project_id     = var.project_id
  metric_scopes  = toset(var.monitored_projects) # List of projects included in metric scopes for MY_MONITORING_PROJECT.
}

resource "google_monitoring_monitored_project" "projects_monitored" {
  for_each      = local.metric_scopes
  metrics_scope = local.project_id
  name          = each.value
}