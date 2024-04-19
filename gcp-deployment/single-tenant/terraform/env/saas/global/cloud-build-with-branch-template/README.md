## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Google Cloudbuild Trigger

Cloud Build is a service that executes your builds on Google Cloud Platform's infrastructure. Cloud Build can import source code from a variety of repositories or cloud storage spaces, execute a build to your specifications, and produce artifacts such as Docker containers or Java archives.


## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.7 |
| google | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.0 |



## Enable APIs

In order to operate with the Service Account you must activate the following APIs on the project where the Service Account was created:

- Cloudbuild API - cloudbuild.googleapis.com

## Usage

Basic usage of this module is as follows:

* Cloudbuild trigger

```hcl

module "cloud_build_trigger_api" {
  source     = "../../modules/cloud-build-with-branch"
  project_id = var.project_id
  name       = var.cloud_build_master_branch_service_api_trigger_conf["name"]
  service_account = var.cloud_build_master_branch_service_api_trigger_conf["service_account"]
  uri        = var.cloud_build_master_branch_service_api_trigger_conf["uri"]
  branch     = var.cloud_build_master_branch_service_api_trigger_conf["branch"]
  path = var.cloud_build_master_branch_service_api_trigger_conf["path"]

}
```

* Provide the variables values to the modules from terraform.tfvars file.

```hcl
cloud_build_master_branch_service_api_trigger_conf = {
  name        = "xxx"
  description = "xxx"
  uri         = "xxx"
  branch      = "xxx"
  path        = "xxx"
  service_account = "xxx"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | GCP Project ID where the cloudbuild trigger will be created. | string | - | yes |
| name | Trigger Name service name. | string | "" | yes |
| service_account | Set service account. | string | "" | yes |
| uri  | URL of repo | string | "" | yes |
| branch  | branch name | string | "" | yes |
| path | specify path. | string | "" | yes |


* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure