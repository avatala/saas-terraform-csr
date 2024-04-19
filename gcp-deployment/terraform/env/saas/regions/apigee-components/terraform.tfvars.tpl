# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

host_project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path   = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"
gcs_state_bucket          = "TF_BUCKET_NAME"
gcs_prefix_path            = "gcp-deployment/terraform/env/PREFIX_NAME/regions/gcs"

env_name = "PREFIX_NAME-env"

// api-proxy details

api_proxies = {
bank-of-anthos-balancereader-v1 = {
   bundle = "bundles/bank-of-anthos-balancereader-v1.zip"
}
bank-of-anthos-transactionhistory-v1 = {
   bundle = "bundles/bank-of-anthos-transactionhistory-v1.zip"  
}
bank-of-anthos-identity-v1 = {
   bundle = "bundles/bank-of-anthos-identity-v1.zip"
}
bank-of-anthos-contacts-api-v1 = {
   bundle = "bundles/bank-of-anthos-contacts-api-v1.zip"
}
}

// shared-flow details

shared_flows = {
SF-bank-of-anthos-auth-v1 = {
   bundle = "bundles/SF-bank-of-anthos-auth-v1.zip"
}
}

// kvm details

kvm_details = {
balance-reader-kvm = {
entry = {}
}

contacts-kvm = {
entry = {}
}

transaction-history-kvm = {
entry = {}
}

boa-config-map = {
entry = {}
}
}

// apigee api-product details

apigee_x_product = {
    balance-reader-product = {
        name = "balance-reader-product-v1"
        operation = [ {
        api_proxy = "bank-of-anthos-balancereader-v1"
        method = []
        path = "/**"
      }]}
    transaction-history-product = {
        name = "transaction-history-product-v1"
        operation = [ {
        api_proxy = "bank-of-anthos-transactionhistory-v1"
        method = []
        path = "/**"
      }]}      
    boa-identity-product = {
        name = "bank-of-anthos-identity-product-v1"
        operation = [ {
        api_proxy = "bank-of-anthos-identity-v1"
        method = []
        path = "/**"
      }]}
    contacts-proxy-product = {
        name = "contacts-product-v1"
        operation = [ {
        api_proxy = "bank-of-anthos-contacts-api-v1"
        method = []
        path = "/**"
     }]}
}
