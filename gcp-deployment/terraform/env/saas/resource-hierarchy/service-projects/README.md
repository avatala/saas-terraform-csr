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
module "service_projects" {
  source                         = "../../../modules/custom-project-factory/svpc_service_project/"
  for_each                       = var.service_projects
  name                           = each.value.project_name
  random_project_id              = false
  org_id                         = var.org_id
  create_project_sa              = false
  folder_id                      = each.value.folder_id
  billing_account                = each.value.billing_account
  default_network_tier           = var.default_network_tier
  activate_apis                  = each.value.activate_apis
  shared_vpc                     = local.host_project_01_project_id
  default_logging_retention_days = each.value.default_logging_retention_days
  grant_services_network_role    = each.value.grant_services_network_role
  labels                         = each.value.labels
}
```

- This module creates Service Project Metadata.

```
module "service_project_metadata" {
  source     = "../../../../../../../modules/custom-compute-project-metadata-item/"
  for_each   = var.service_projects
  project    = each.value.project_name
  metadata   = each.value.metadata
  depends_on = [module.service_projects]
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
| service\_projects | The Project name, Billing Account and APIs list for the Service project. | <pre>map(object({<br>    project_name                   = string,<br>    folder_id                      = string,<br>    billing_account                = string,<br>    activate_apis                  = list(string),<br>    default_logging_retention_days = string,<br>    grant_services_network_role    = bool,<br>    labels                         = map(string),<br>    metadata = list(object({<br>      key   = string<br>      value = string<br>    }))<br>  }))</pre> | <pre>service_project = {<br>      project_name                   = ""<br>      folder_id                      = ""<br>      billing_account                = ""<br>      activate_apis                  = []<br>      default_logging_retention_days = ""<br>      grant_services_network_role    = true<br>      labels                         = {}<br>      metadata                       = []<br>  }</pre> | yes |
| org\_id | The organization ID. | `string` | `n/a` | yes |
| default\_network\_tier | Default Network Service Tier for resources created in this project. | `string` | `""` | yes |
| random\_project\_id | Adds a suffix of 4 random characters to the `project_id`. | `bool` | `false` | no |
| create\_project\_sa | Whether the default service account for the project shall be created. | `bool` | `true` | no |

## Local Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| host\_project\_01\_project\_id | The GCP project ID. This is rendered from the remote state using the GCS backend bucket. |  `string` | `n/a` | yes |

## Outputs

| Name | Description |
|------|-------------|
| service\_projects | The details of the GCP service projects attached to the Host project. | 
| service\_project\_metadata | The details of the created Service Project Metadata. |

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

In order to operate the Project Factory, you must activate the following APIs on
the base project where the Service Account was created:

- Cloud Resource Manager API - `cloudresourcemanager.googleapis.com`
- Cloud Billing API - `cloudbilling.googleapis.com`
- Identity and Access Management API - `iam.googleapis.com`
- Cloud Billing Budget API - `billingbudgets.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.0
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.50, < 5.0
- [terraform-provider-google-beta](https://github.com/terraform-providers/terraform-provider-google-beta) plugin >= 3.50, < 5.0