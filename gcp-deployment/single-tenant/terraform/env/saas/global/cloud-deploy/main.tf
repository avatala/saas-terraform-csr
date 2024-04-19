module "cloud_deploy_pipelines" {
  source        = "../../../modules/cloud-deploy"
  for_each      = local.cloud_deploy_pipelines
  project       = each.value.project
  pipeline_name = each.value.pipeline_name
  description   = each.value.description
  location      = each.value.location
  stage_targets = each.value.stage_targets
}