## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# VPC Serverless Connector Module

This submodule is part of the the `terraform-google-network` module. It creates the vpc serverless connector using the beta components available.

It supports creating:

- VPC serverless connector
- serverless vpc access connector


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

- [roles/compute.networkAdmin](https://cloud.google.com/iam/docs/understanding-roles)

## Enable APIs

In order to operate with the Service Account you must activate the following APIs on the project where the Service Account was created:

- VPC Access API: vpcaccess.googleapis.com


## Usage
Basic usage of this module is as follows:

* VPC Serverless Connector

```hcl
module "serverless-connector" {
  source     = "../../../modules/vpc-serverless-connector/"
  project_id = var.project_id
  vpc_connectors = [{
    name        = var.name
    region      = var.region
    subnet_name = var.subnet_name
    machine_type  = var.machine_type
    min_instances = var.min_instances
    max_instances = var.max_instances
    }
  ]
}
```

* Provide the variables values to the modules from terraform.tfvars file.

```hcl
project_id = "project_id"
region     = "us-central1"
name       = "example-sva"
subnet_name = "example-subnet0"
network = "example-network"
ip_cidr_range = "X.X.X.X/28"
machine_type    = "f1-micro"
min_instances   = 2
max_instances   = 3

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | Project in which the vpc connector will be deployed. | string | - | yes |
| vpc_connectors | List of VPC serverless connectors. | list(map(string)) | `[]` | no |
| name | Name of the serverless-connector. | string | - | yes |
| region | Name of the region being created. | string | - | yes |
| subnet_name | name of the subnet being created. | string | - | yes |
| network | Name or self_link of the VPC network. Required if ip_cidr_range is set | string | - | yes |
| machine_type | name of the machine_type being created | string | - | no |
| min_instances | Numbers of the min_instances being created. | string | "" | no |
| max_instances | Numbers of the max_instances being created. | string | "" | no |

## Outputs

| Name | Description |
|------|-------------|
| project | VPC serverless connector Project ID. |
| name | Name of the VPC serverless connector. |
| region | Region of the VPC serverless connector. |
| connector_ids | ID of the VPC serverless connector that was deployed. |




* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
