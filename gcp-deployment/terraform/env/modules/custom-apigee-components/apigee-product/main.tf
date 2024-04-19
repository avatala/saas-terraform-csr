resource "apigee_product" "example" {
  name = var.name
  display_name = var.display_name
  auto_approval_type = var.auto_approval_type
  description = var.description
  environments = var.environments
  scopes = var.scopes
  attributes = var.attributes
  # quota = var.operation.0["quota"]
  # quota_interval = var.operation.0["quota_interval"]
  # quota_time_unit = var.operation.0["quota_time_unit"]
  dynamic "operation" {
    for_each = var.operation
    content {
    api_source = operation.value["api_proxy"]
    path       = operation.value["path"]
    methods    = operation.value["method"]
    # quota           = operation.value["quota"]
    # quota_interval  = operation.value["quota_interval"]
    # quota_time_unit = operation.value["quota_time_unit"]
    # attributes = var.attributes
  }
  }
}