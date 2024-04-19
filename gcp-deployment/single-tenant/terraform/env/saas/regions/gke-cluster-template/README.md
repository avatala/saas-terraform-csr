## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Kubernetes Engine Module

This module handles opinionated Google Cloud Platform Kubernetes Engine cluster creation and configuration with Node Pools, IP MASQ, Network Policy, etc. This particular submodule creates a [private cluster](https://cloud.google.com/kubernetes-engine/docs/how-to/private-clusters)Beta features are enabled in this submodule.
The resources/services/activations/deletions that this module will create/trigger are:
- Create a GKE cluster with the provided addons
- Create GKE Node Pool(s) with provided configuration and attach to cluster
- Replace the default kube-dns configmap if `stub_domains` are provided
- Activate network policy if `network_policy` is true
- Add `ip-masq-agent` configmap with provided `non_masquerade_cidrs` if `configure_ip_masq` is true

Sub modules are provided for creating private clusters, beta private clusters, and beta public clusters as well.  Beta sub modules allow for the use of various GKE beta features. See the modules directory for the various sub modules.

## Private Cluster Details
For details on configuring private clusters with this module, check the [troubleshooting guide](https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/blob/master/docs/private_clusters.md).

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

```
module "main_vpc_gke_private_clusters" {
  source                       = "../../../../../modules/terraform-google-kubernetes-engine/beta-private-cluster"
  for_each                     = var.main_vpc_gke_private_clusters
  project_id                   = data.terraform_remote_state.project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  name                         = each.value.name
  region                       = each.value.region
  network                      = data.terraform_remote_state.vpc_network.outputs.vpc_networks.vpc_network_01["network_name"]
  subnetwork                   = each.value.subnetwork
  ip_range_pods                = each.value.ip_range_pods
  ip_range_services            = each.value.ip_range_services
  create_service_account       = each.value.create_service_account
  regional                     = each.value.regional
  http_load_balancing          = each.value.http_load_balancing
  network_policy               = each.value.network_policy
  gce_pd_csi_driver            = each.value.gce_pd_csi_driver
  horizontal_pod_autoscaling   = each.value.horizontal_pod_autoscaling
  enable_private_endpoint      = each.value.enable_private_endpoint
  enable_private_nodes         = each.value.enable_private_nodes
  master_ipv4_cidr_block       = each.value.master_ipv4_cidr_block
  remove_default_node_pool     = each.value.remove_default_node_pool
  maintenance_recurrence       = each.value.maintenance_recurrence
  maintenance_start_time       = each.value.maintenance_start_time
  maintenance_end_time         = each.value.maintenance_end_time
  kubernetes_version           = each.value.kubernetes_version
  cluster_resource_labels      = each.value.cluster_resource_labels
  enable_binary_authorization  = each.value.enable_binary_authorization
  master_global_access_enabled = each.value.master_global_access_enabled
  master_authorized_networks   = each.value.master_authorized_networks
  node_pools                   = each.value.node_pools
  node_pools_labels            = each.value.node_pools_labels
  node_pools_taints            = each.value.node_pools_taints
}
```

Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_state\_bucket | The Terraform state bucket name for the Project ID. | `string` | `""` | yes |
| project\_prefix\_path | The Terraform state bucket prefix path for the Project ID. | `string` | `""` | yes |
| network\_state\_bucket | The Terraform state bucket name for the Network Name. | `string` | `""` | yes |
| network\_prefix\_path | The Terraform state bucket prefix path for the Network Name. | `string` | `""` | yes |
| main\_vpc\_gke\_private\_clusters | The details of the GKE cluster. | <pre>map(object({<br>    name                         = string,<br>    region                       = string,<br>    subnetwork                   = string,<br>    ip_range_pods                = string,<br>    ip_range_services            = string,<br>    create_service_account       = bool,<br>    regional                     = bool,<br>    http_load_balancing          = bool,<br>    network_policy               = bool,<br>    gce_pd_csi_driver            = bool,<br>    horizontal_pod_autoscaling   = bool,<br>    enable_private_endpoint      = bool,<br>    enable_private_nodes         = bool,<br>    master_ipv4_cidr_block       = string,<br>    remove_default_node_pool     = bool,<br>    maintenance_recurrence       = string,<br>    maintenance_start_time       = string,<br>    maintenance_end_time         = string,<br>    kubernetes_version           = string,<br>    cluster_resource_labels      = map(string),<br>    enable_binary_authorization  = bool,<br>    master_global_access_enabled = bool,<br>    master_authorized_networks = list(object({<br>      cidr_block   = string,<br>      display_name = string<br>    }))<br>    node_pools        = list(map(string)),<br>    node_pools_labels = map(map(string)),<br>    node_pools_taints = map(list(object({<br>      key    = string,<br>      value  = string,<br>      effect = string<br>    })))<br>}))</pre> | <pre>main_vpc_gke_private_cluster = {<br>  name                         = ""<br>  region                       = ""<br>  subnetwork                   = ""<br>  ip_range_pods                = ""<br>  ip_range_services            = ""<br>  create_service_account       = true<br>  regional                     = true<br>  http_load_balancing          = true<br>  network_policy               = false<br>  gce_pd_csi_driver            = false<br>  horizontal_pod_autoscaling   = true<br>  enable_private_endpoint      = false<br>  enable_private_nodes         = false<br>  master_ipv4_cidr_block       = ""<br>  remove_default_node_pool     = false<br>  maintenance_recurrence       = ""<br>  maintenance_start_time       = ""<br>  maintenance_end_time         = ""<br>  kubernetes_version           = ""<br>  cluster_resource_labels      = {}<br>  enable_binary_authorization  = false<br>  master_global_access_enabled = true<br>  master_authorized_networks   = []<br>  node_pools = [<br>    {<br>      name = "default-node-pool"<br>    }<br>  ]<br>  node_pools_labels = {<br>    all               = {}<br>    default-node-pool = {}<br>  }<br>  node_pools_taints = {<br>    all               = []<br>    default-node-pool = []<br>  }<br>}</pre> | yes |

## Outputs

| Name | Description |
|------|-------------|
| main\_vpc\_gke\_private\_clusters | The details of the created GKE Clusters. | 

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:
- `roles/compute.viewer`
- `roles/compute.securityAdmin` (only required if `add_cluster_firewall_rules` is set to `true`)
- `roles/container.clusterAdmin`
- `roles/container.developer`
- `roles/iam.serviceAccountAdmin`
- `roles/iam.serviceAccountUser`
- `roles/resourcemanager.projectIamAdmin` (only required if `service_account` is set to `create`)

## APIs

In order to operate this module, you must activate the following APIs on the project:

- Compute Engine API - `compute.googleapis.com`
- Kubernetes Engine API - `container.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >=0.13
- [terraform-provider-google-beta](https://github.com/terraform-providers/terraform-provider-google-beta) plugin >= 4.10.0, < 5.0