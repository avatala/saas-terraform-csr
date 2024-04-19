module "api-proxy" {
  source = "../../../modules/custom-apigee-components/api-proxy"
  for_each = var.api_proxies
  name = each.key
  bundle = each.value.bundle
  env_name = var.env_name
  depends_on = [
    module.shared-flow
  ]
}

module "api-proxy-kvm" {
  source = "../../../modules/custom-apigee-components/api-kvm"
  for_each = var.kvm_details
  name = each.key
  entry = each.value.entry
  env_name = var.env_name
  depends_on = [
    module.api-proxy
  ]
}

module "shared-flow" {
  source = "../../../modules/custom-apigee-components/shared-flow"
  for_each = var.shared_flows
  name = each.key
  bundle = each.value.bundle
  env_name = var.env_name
}

module "apigee-x-product"{
source = "../../../modules/custom-apigee-components/apigee-product"
for_each = var.apigee_x_product
name = each.value.name
display_name = each.value.name
environments = [var.env_name]
operation = each.value.operation
depends_on = [
  module.api-proxy
]
}
