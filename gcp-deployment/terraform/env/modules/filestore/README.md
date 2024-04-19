## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Filestore module for Google Cloud Platform

A module to manage Google Cloud Filestore instance.​

GCP's Filestore is a managed file storage service for applications that require a file system interface and a shared file system for data. It gives the user a native experience for standing up managed network detached storage with their VM in the compute engine and Google Kubernetes Engine.
​
## Usage
Basic usage of this module is as follows:

* Filestore

```
resource "google_filestore_instance" "instance" {
  name     = var.name
  location = var.location
  tier     = var.tier
  project  = var.project_id
  file_shares {
    capacity_gb = var.capacity_gb
    name        = var.file_shares_name
  }
  networks {
    network           = var.network
    modes             = var.modes
    reserved_ip_range = var.reserved_ip_range
    connect_mode      = var.connect_mode
  }
}
```

## Inputs
Provide the variables values to the modules from terraform.tfvars file.
>
| Name | Description | Type |
|------|-------------|------|
| project_id | the id of project in which filestore will be created | string |
| name | the name of the filestore | string |
| network | the network that the filestore will use.| string |
| tier | the usage tier of filestore | string |
| location | the zone of deployment of filestore | string | 
| capacity_gb | File share capacity in GiB. This must be at least 1024 GiB for the standard tier | number |
| file_shares_name | The name of the fileshare (16 characters or less) | string |
| reserved_ip_range | A /29 CIDR block that identifies the range of IP addresses reserved for this instance | string |
| connect_mode | The network connect mode of the Filestore instance. If not provided, the connect mode defaults to DIRECT_PEERING. | string | 
| modes | IP versions for which the instance has IP addresses assigned. VEach of values may be ADDRESS_MODE_UNSPECIFIED, MODE_IPV4, and MODE_IPV6 | list(string) |

## Outputs​
| Name | Description |
|------|-------------|
| google_filestore_instance | The details of the filestore instance |
## Permissions
In order to execute this module you must have a Service Account with the following permissions and roles:

- `roles/file.editor`

## APIs
In order to operate this module, you must activate the following APIs on the project:

- Filestore API - `file.googleapis.com`

## Terraform plugins
- Terraform >= 0.13

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