resource "google_monitoring_group" "basic" {
  project      = var.project_id
  display_name = var.group_name
  filter       = var.filter
}