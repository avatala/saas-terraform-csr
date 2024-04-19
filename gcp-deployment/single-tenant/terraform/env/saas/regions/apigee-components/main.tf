module "apigee_developer" {
  source = "../../../modules/custom-apigee-components/apigee-developer"
  for_each = var.apigee_devs
  first_name = each.value.first_name
  last_name = each.value.last_name
  username = each.value.username
  email = each.value.email
}

module "apigee_developer_app" {
  source = "../../../modules/custom-apigee-components/apigee-developer-app"
  for_each = var.apigee_dev_apps
  app_name = each.key
  callback_url = each.value.callback_url
  email = var.apigee_devs["${_PREFIX}-dev"].email
  depends_on = [
    module.apigee_developer
  ]
}
