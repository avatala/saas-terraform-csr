## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Nat-Gateway module for Google Cloud Platform

This module makes it easy to create NAT Gateway for the GCP Network.

- NAT Gateway

## Usage
Basic usage of this module is as follows:

* Cloud NAT Gateway

```hcl
resource "random_string" "name_suffix" {
  length  = 6
  upper   = false
  special = false
}

locals {
  # intermediate locals
  default_name                   = "cloud-nat-${random_string.name_suffix.result}"
  nat_ips_length                 = length(var.nat_ips)
  default_nat_ip_allocate_option = local.nat_ips_length > 0 ? "MANUAL_ONLY" : "AUTO_ONLY"
  # locals for google_compute_router_nat
  nat_ip_allocate_option = var.nat_ip_allocate_option ? var.nat_ip_allocate_option : local.default_nat_ip_allocate_option
  name                   = var.name != "" ? var.name : local.default_name
  router                 = var.create_router ? google_compute_router.router[0].name : var.router
}

resource "google_compute_router" "router" {
  count   = var.create_router ? 1 : 0
  name    = var.router
  project = var.project_id
  region  = var.region
  network = var.network
  bgp {
    asn = var.router_asn
  }
}

resource "google_compute_router_nat" "main" {
  project                            = var.project_id
  region                             = var.region
  name                               = local.name
  router                             = local.router
  nat_ip_allocate_option             = local.nat_ip_allocate_option
  nat_ips                            = var.nat_ips
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  min_ports_per_vm                   = var.min_ports_per_vm
  udp_idle_timeout_sec               = var.udp_idle_timeout_sec
  icmp_idle_timeout_sec              = var.icmp_idle_timeout_sec
  tcp_established_idle_timeout_sec   = var.tcp_established_idle_timeout_sec
  tcp_transitory_idle_timeout_sec    = var.tcp_transitory_idle_timeout_sec

  dynamic "subnetwork" {
    for_each = var.subnetworks
    content {
      name                     = subnetwork.value.name
      source_ip_ranges_to_nat  = subnetwork.value.source_ip_ranges_to_nat
      secondary_ip_range_names = contains(subnetwork.value.source_ip_ranges_to_nat, "LIST_OF_SECONDARY_IP_RANGES") ? subnetwork.value.secondary_ip_range_names : []
    }
  }

  dynamic "log_config" {
    for_each = var.log_config_enable == true ? [{
      enable = var.log_config_enable
      filter = var.log_config_filter
    }] : []

    content {
      enable = log_config.value.enable
      filter = log_config.value.filter
    }
  }
}

```

## Inputs
Provide the variables values to the modules from terraform.tfvars file.
>
| Name | Description | Type | Default |
|------|-------------|------|------ |
| project_id | The project ID to deploy to | string | - |
| region | The region to deploy to | string | - | 
| icmp_idle_timeout_sec | Timeout (in seconds) for ICMP connections. Defaults to 30s if not set. Changing this forces a new NAT to be created. | number | 30 |
| min_ports_per_vm | Minimum number of ports allocated to a VM from this NAT config. Defaults to 64 if not set. Changing this forces a new NAT to be created | number | 64 | 
| name | Defaults to 'cloud-nat-RANDOM_SUFFIX'. Changing this forces a new NAT to be created. | string | - |
| nat_ip_allocate_option | Value inferred based on nat_ips. If present set to MANUAL_ONLY, otherwise AUTO_ONLY | - | false |
| nat_ips | List of self_links of external IPs. Changing this forces a new NAT to be created. | list(string) | [] |
| network | VPN name, only if router is not passed in and is created by the module | string | - | 
| create_router | Create router instead of using an existing one, uses 'router' variable for new resource name. | - | false |
| router | The name of the router in which this NAT will be configured. Changing this forces a new NAT to be created. | - | - |
| router_asn | Router ASN, only if router is not passed in and is created by the module. | number | 64514 |
| source_subnetwork_ip_ranges_to_nat | Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES. How NAT should be configured per Subnetwork. Valid values include: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS. Changing this forces a new NAT to be created. | - | ALL_SUBNETWORKS_ALL_IP_RANGES |
| tcp_established_idle_timeout_sec | Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set. Changing this forces a new NAT to be created | number | 1200 |
| tcp_transitory_idle_timeout_sec | Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set. Changing this forces a new NAT to be created. | number | 30 |
| udp_idle_timeout_sec | Timeout (in seconds) for UDP connections. Defaults to 30s if not set. Changing this forces a new NAT to be created. | number | 30 | 
| subnetworks | subnetworks | <pre>list(object({<br>    name                     = string,<br>    source_ip_ranges_to_nat  = list(string)<br>    secondary_ip_range_names = list(string)<br>  }))</pre> | [] |
| log_config_enable | Indicates whether or not to export logs | bool | false |
| log_config_filter | Specifies the desired filtering of logs on this NAT. Valid values are: \"ERRORS_ONLY\", \"TRANSLATIONS_ONLY\", \"ALL\" | string | ALL |

## Outputs
| Name | Description |
|------|-------------|
| name | Name of the Cloud NAT |
| nat_ip_allocate_option | NAT IP allocation mode |
| region | Cloud NAT region |
| router_name | Cloud NAT router name |
## Permissions
In order to execute this module you must have a Service Account with the following permissions and roles:

- `roles/compute.networkAdmin`

### Enable APIs
In order to operate with the Service Account you must activate the following APIs on the project where the Service Account was created:

- Compute Engine API - compute.googleapis.com

## Terraform plugins
- Terraform >= 0.12

## Flow of Terraform Commands to follow
Perform the following commands on the root folder:
​
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure


## The Terraform resources will consists of following structure
```
├── README.md                 // Description of the module and what it should be used for.
├── main.tf                   // The primary entrypoint for terraform resources.
├── variables.tf              // It contain the declarations for variables.
├── outputs.tf                // It contain the declarations for outputs.
├── versions.tf               // To specify terraform versions.
```