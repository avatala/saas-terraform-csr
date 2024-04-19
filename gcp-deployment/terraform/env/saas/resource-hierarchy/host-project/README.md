## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Custom Project Factory Module

This module allows you to create opinionated Google Cloud Platform projects. It creates projects and configures aspects like Shared VPC connectivity, Service Accounts, and API enablement to follow best practices.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

- This module creates Service Project.

```
module "standalone_projects" {
  source                         = "../modules/custom-project-factory/fabric-project-folder"
  for_each                       = var.standalone_projects
  name                           = each.value.project_name
  prefix                         = each.value.prefix
  parent                         = each.value.folder_id
  billing_account                = each.value.billing_account
  activate_apis                  = each.value.activate_apis
  default_logging_retention_days = each.value.default_logging_retention_days
  labels                         = each.value.labels
}
```

Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| standalone\_projects | The Project name, Billing Account and APIs list for the Service project. | <pre>map(object({<br>    project_name                   = string,<br>    folder_id                      = string,<br>    billing_account                = string,<br>    prefix                         = string,<br>    activate_apis                  = list(string),<br>    default_logging_retention_days = string,<br>    labels                         = map(string)<br>}))</pre> | <pre>standalone_project = {<br>  project_name                   = ""<br>  folder_id                      = ""<br>  prefix                         = ""<br>  billing_account                = ""<br>  activate_apis                  = []<br>  default_logging_retention_days = ""<br>  labels                         = {}<br>}</pre> | yes |

## Outputs

| Name | Description |
|------|-------------|
| standalone/_projects | The details of the GCP Standalone projects. |

## Permissions

In order to execute this module you must have a Service Account with the
following roles:

- `roles/resourcemanager.folderViewer` on the folder that you want to create the
  project in
- `roles/resourcemanager.organizationViewer` on the organization
- `roles/resourcemanager.projectCreator` on the organization
- `roles/billing.user` on the organization
- `roles/storage.objectAdmin` on the seed project

If you are using shared VPC:

  - `roles/billing.user` on the organization
  - `roles/compute.xpnAdmin` on the organization
  - `roles/browser` on the Shared VPC host project

## APIs

In order to operate the Project Factory, you must activate the following APIs on the base project where the Service Account was created:

- Cloud Resource Manager API - `cloudresourcemanager.googleapis.com`
- Cloud Billing API - `cloudbilling.googleapis.com`
- Identity and Access Management API - `iam.googleapis.com`
- Cloud Billing Budget API - `billingbudgets.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.43, < 5.0