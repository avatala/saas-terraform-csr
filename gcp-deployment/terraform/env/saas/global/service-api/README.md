## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Project Google Project Service Module

- Allows management of enabled API services for an existing Google Cloud Platform project.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.7 |
| google | ~> 3.0 |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.7 |
| google | ~> 3.0 |


## Usage
Basic usage of this module is as follows:

* Custom roles

```hcl

module "project-services" {
  source                     = "../../modules/service-api"
  disable_dependent_services = var.disable_dependent_services
  project_id                 = var.project_id
  activate_apis              = var.activate_apis
}
```

* Provide the variables values to the modules from terraform.tfvars file.

```hcl

project_id                 = "XXX"
activate_apis              = ["XXX"]
disable_dependent_services = XXX

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | GCP Project ID where the services api will enable. | string | - | yes |
| activate_apis| The list of apis to activate within the project. | string | "" | yes |
| disable_dependent_services| Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed.. | string | "" | yes |

## Outputs

| Name | Description |
|------|-------------|
| project_id | The GCP project you want to enable APIs on |