project_state_bucket = "${_TF_STATE_BUCKET_NAME}" 
gke_prefix_path      = "gcp-deployment/terraform/env/single-tenant/regions/${_CUSTOMER_NAME}-gke-cluster"
worker_pool_prefix_path = "gcp-deployment/terraform/env/${_PREFIX}/regions/worker-pool"