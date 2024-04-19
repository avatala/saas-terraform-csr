locals {
cloud_deploy_pipelines = {
  cloud_deploy_pipeline_01 = {
    pipeline_name    = "saas-delivery-pipeline-${_CUSTOMER_NAME}"
    project          = "${_ENTERPRISE_PROJECT_ID}"
    description      = "main application pipeline"
    location         = "${_CUSTOMER_REGION}"
    stage_targets = [{
      target                            = "saas-dev-${_CUSTOMER_NAME}"
      description                       = "development cluster"
      profiles                          = []
      gke                               = "projects/${_ENTERPRISE_PROJECT_ID}/locations/${_CUSTOMER_REGION}/clusters/${data.terraform_remote_state.gke_cluster.outputs.main_vpc_gke_private_clusters.main_vpc_gke_private_cluster_01.name}"
      internal_ip                       = true
      artifact_storage                  = null
      require_approval                  = false
      execution_configs_service_account = "${_CUSTOMER_NAME}-saas-clouddeploy-sa@${_ENTERPRISE_PROJECT_ID}.iam.gserviceaccount.com"
      worker_pool                       = "projects/${_ANTHOS_PROJECT_ID}/locations/${_PRE_REQ_REGION}/workerPools/${data.terraform_remote_state.worker_pool.outputs.details.cloud_build_worker_pool_01.worker_pool}"
    }]
  }
}
}