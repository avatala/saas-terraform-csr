resource "google_clouddeploy_delivery_pipeline" "delivery_pipeline" {
  name       = var.pipeline_name
  project    = var.project
  description= var.description
  location   = var.location
  serial_pipeline {
    dynamic "stages" {
      for_each = var.stage_targets
      content {
        profiles  = stages.value["profiles"]
        target_id = stages.value["target"]
      }
    }
  }
}


resource "google_clouddeploy_target" "target" {
  for_each   = { for tar in var.stage_targets : tar.target => tar }
  location   = var.location
  name       = each.value.target
  description = each.value.description
  gke {
    cluster = each.value.gke
    internal_ip = each.value.internal_ip
  }
  require_approval = each.value.require_approval
  project          = var.project
  execution_configs {
    usages           = ["RENDER","DEPLOY"]
    service_account  = each.value.execution_configs_service_account
    worker_pool      = each.value.worker_pool
    artifact_storage = each.value.artifact_storage != null ? each.value.artifact_storage : ""
  }
}
