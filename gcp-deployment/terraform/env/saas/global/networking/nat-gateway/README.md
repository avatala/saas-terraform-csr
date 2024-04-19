## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Project NAT Gateway Module

This module makes it easy to create NAT Gateway for the GCP Network.

- Static External IP addresses
- Cloud Router
- NAT Gateway

## Usage
Basic usage of this module is as follows:

* Reserve Static External IP addresses

```hcl
resource "google_compute_address" "address" {
  count  = 2
  name   = "example-ext-ip-${count.index}"
  region = var.region
}
```

* Cloud Router

```hcl
resource "google_compute_router" "router" {
  name    = "${var.vpc_name}-nat-router"
  region  = var.region
  network = var.vpc_name
}
```

* Cloud NAT Gateway

```hcl
module "cloud_nat" {
  source                             = "../../../modules/networking/nat_gateway"
  
  project_id                         = var.project_id
  region                             = var.region
  router                             = google_compute_router.router.name
  name                               = "${var.vpc_name}-nat-gw"
  nat_ips                            = google_compute_address.address.*.self_link
  min_ports_per_vm                   = "128"
  icmp_idle_timeout_sec              = "15"
  tcp_established_idle_timeout_sec   = "600"
  tcp_transitory_idle_timeout_sec    = "15"
  udp_idle_timeout_sec               = "15"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
```

* Provide the variables values to the modules from terraform.tfvars file.

```hcl
project_id   = "example-project"
region       = "us-east4"
vpc_name     = "example-vpc"
```

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure