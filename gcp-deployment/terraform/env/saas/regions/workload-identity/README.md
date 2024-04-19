## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Workload Identity Module

[`Workload Identity`](https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity) is the recommended way to access GCP services from Kubernetes.

This module creates:

* IAM Service Account binding to `roles/iam.workloadIdentityUser`
* Optionally, a Google Service Account
* Optionally, a Kubernetes Service Account

## Compatibility

This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

```
module "workload_identities" {
  source              = "../modules/terraform-google-kubernetes-engine/workload-identity"
  for_each            = var.workload_identities
  project_id          = each.value.project_id
  name                = each.value.name
  namespace           = each.value.namespace
  use_existing_k8s_sa = true
  k8s_sa_name         = each.value.k8s_sa_name
  use_existing_gcp_sa = true
  annotate_k8s_sa     = false
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
| workload\_identities | The details of the Workload Identity creation for existing GSA and KSA. | <pre>map(object({<br>    project_id  = string,<br>    name        = string,<br>    namespace   = string,<br>    k8s_sa_name = string<br>}))</pre> | <pre>workload_identity = {<br>    project_id  = ""<br>    name        = ""<br>    namespace   = ""<br>    k8s_sa_name = ""<br>}</pre> | yes |
| use\_existing\_k8s\_sa | Use an existing kubernetes service account instead of creating one. | bool | false | yes |
| use\_existing\_gcp\_sa | Use an existing Google service account instead of creating one. | bool | false | yes |
| annotate\_k8s\_sa | Annotate the kubernetes service account with 'iam.gke.io/gcp-service-account' annotation. Valid in cases when an existing SA is used. | bool | true | yes |

## Outputs

| Name | Description |
|------|-------------|
| workload\_identities | The details of the created Workload Identity creation for existing GSA and KSA. | 

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.0
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.39.0, < 5.0
- [hashicorp/kubernetes](https://github.com/hashicorp/terraform-provider-kubernetes) plugin ~> 2.0