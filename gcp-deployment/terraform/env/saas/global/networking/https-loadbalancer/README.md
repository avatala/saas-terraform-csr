## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Google Cloud HTTPS Load Balancer Module

Modular Global HTTPS Load Balancer for Backend Bucket using forwarding rules.

- Backend buckets allow you to use Google Cloud Storage buckets with HTTP(S) load balancing.

- An HTTP(S) load balancer can direct traffic to specified URLs to a backend bucket rather than a backend service. It can send requests for static content to a Cloud Storage bucket.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.7 |
| google | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.0 |

## Configure a Service Account

In order to execute this module you must have a Service Account with the
following project roles:

- [roles/compute.loadBalancerAdmin](https://cloud.google.com/iam/docs/understanding-roles)

## Enable APIs

In order to operate with the Service Account you must activate the following APIs on the project where the Service Account was created:

- Compute Engine API - compute.googleapis.com

## Usage

Basic usage of this module is as follows:

* GCS Bucket

```hcl
module "lb" {
  source                = "./terraform-google-load-balancer/modules/http-load-balancer"
  project = var.project_id
  name = var.name
  static_ip             = data.google_compute_global_address.default.name
  enable_ssl            = var.enable_ssl
  custom_labels = var.custom_labels
  lb_name = var.lb_name
  enable_cdn = var.enable_cdn
  backend_bucket_name = var.backend_bucket_name
  bucket_name = var.bucket_name
  ssl_cert_name = var.ssl_cert_name
  cache_mode        = var.cache_mode 
  client_ttl        = var.client_ttl 
  default_ttl       = var.default_ttl
  max_ttl           = var.max_ttl
  negative_caching  = var.negative_caching
  serve_while_stale = var.serve_while_stale 
  hosts             = var.hosts
  port_range = var.port_range
}

data "google_compute_global_address" "default" {
  name         = var.static_ip_name
}
```

* Provide the variables values to the modules from terraform.tfvars file.

```hcl
project_id ="project_id"
region ="region"

static_ip_name ="static-ip-address"

/** SSL configuration **/
hosts        = ["example.com"]
ssl_cert_name ="ssl-cert-name"
port_range ="Https-port-range"
  

lb_name = "lb-https-url"
custom_labels={
  project = "project-id"
  env     ="env-name"
  region  = "region"
}

name = "prefix-name" #prefix-name used for lb proxy and forwarding rule

/** Backend Bucket Configuration **/
enable_ssl ="true/false"
backend_bucket_name = "backend-bucket-name"
bucket_name = "bucket-name"
enable_cdn ="true/false"
cache_mode        = "cache-mode"
client_ttl        = "3600" #1hour
default_ttl       = "3600"
max_ttl           = "86400" #1day
negative_caching  = "true/false"
serve_while_stale = "86400" 
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | GCP Project ID where the loadbalancer will be created. | string | - | yes |
| region | GCP region where the loadbalancer will be created. | string | - | yes |
| port_range | HTTPS Port number. | string | - | yes |
| backend_bucket_name | Backend bucket service name. | string | "" | yes |
| enable_cdn | Set to true to enable cdn on backend. | bool | "" | yes |
| bucket_name | Cloud Storage bucket name. | string | "" | yes |
| cache_mode | Specifies the cache setting for all responses from this backend. The possible values are: USE_ORIGIN_HEADERS, FORCE_CACHE_ALL and CACHE_ALL_STATIC Possible values are USE_ORIGIN_HEADERS, FORCE_CACHE_ALL, and CACHE_ALL_STATIC. | string | "" | yes |
| ssl_cert_name | Cloud Storage bucket name. | string | "" | no |
| hosts | Domains for which a managed SSL certificate will be valid. | list(string) | - | yes |
| max_ttl | Specifies the maximum allowed TTL for cached content served by this origin. | number | "" | no |
| client_ttl | Specifies the maximum allowed TTL for cached content served by this origin. | number | "" | no |
| default_ttl | Specifies the default TTL for cached content served by this origin for responses that do not have an existing valid TTL (max-age or s-max-age). | number | "" | no |
| custom_labels_https_fwd_rule | Custom Labels used for HTTPS Forwarding rule | map(string) | "" | no |

## Outputs

| Name | Description |
|------|-------------|
| load_balancer_ip_address | IP address of the Cloud Load Balancer. |
| loadbalancer_name | Name of load balancer name. |


* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure