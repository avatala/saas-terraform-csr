resource "random_string" "id" {
  keepers = {
      uuid = var.lookup_resource
  }
  special = var.special
  upper   = var.upper
  numeric = var.numeric
  length  = var.string_length
}