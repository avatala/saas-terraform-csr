resource "apigee_developer_app" "example" {
  developer_email = var.email
  name = var.app_name
  callback_url = var.callback_url
  attributes = var.attributes
}
