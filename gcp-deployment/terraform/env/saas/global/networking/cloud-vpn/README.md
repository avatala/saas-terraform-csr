## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Project HA VPN Module

This module makes it easy to create HA VPN from GCP to On-prem.

## Usage
Basic usage of this module is as follows:

* HA VPN

```hcl
module "vpn_ha" {
  source                = "../../../modules/networking/vpn"
  project_id            = var.project_id
  region                = var.region
  network               = var.vpc_name
  name                  = var.vpn_name
  peer_external_gateway = {
      redundancy_type   = "SINGLE_IP_INTERNALLY_REDUNDANT"
      interfaces = [{
          id         = 0
          ip_address = var.on_prem_router_ip # on-prem router ip address
      }]
  }
  router_asn    = 64514
  tunnels       = {
    remote-0    = {
      bgp_peer  = {
        address = "169.254.1.1"
        asn     = 64513
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.1.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = 0
      shared_secret                   = var.secret_key_phrase0
    }
    remote-1    = {
      bgp_peer  = {
        address = "169.254.2.1"
        asn     = 64513
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.2.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = 0
      shared_secret                   = var.secret_key_phrase1
    }
  }
}
```

* Provide the variables values to the modules from terraform.tfvars file.

```hcl
project_id   = "example.com"
region       = "us-central1"
vpc_name     = "example-vpc"

/* VPN Config */
vpn_name                  = "example-gcp-to-onprem-vpn"
on_prem_router_ip         = "A.B.C.D"
secret_key_phrase0        = "example-random-string0"
secret_key_phrase1        = "example-random-string1"
```

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure