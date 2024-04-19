resource "apigee_developer" "Developer" {
  email = var.email
  first_name = var.first_name
  last_name = var.last_name
  user_name = var.username
  attributes = var.attributes
}