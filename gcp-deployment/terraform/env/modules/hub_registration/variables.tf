# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
variable "hub_project_id" {
  description = "name of the hub project where cluster will register"
}

variable "cluster_project_id" {
  description = "name of the project where cluster deployed"
}

variable "region" {
  description = "Name of the region"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
}



/*variable "kubeconfig_path" {
  description = "directory path of kube config"
}

variable "oidc_url" {
  description = "The URL on the EKS cluster for the OpenID Connect identity provider"
}

variable "context" {
  description = "The Amazon Resource Name (ARN) of the cluster"
}*/

