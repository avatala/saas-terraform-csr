# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_id" {
  description = "The project in which the resource belongs."
  type        = string
}

variable "cluster_project_id" {
  description = "The project in which the resource belongs."
  type        = string
}
variable "cluster_name" {
  description = "The unique name to identify the cluster in ASM."
  type        = string
}

variable "cluster_location" {
  description = "The cluster location for this ASM installation."
  type        = string
}

variable "fleet_id" {
  description = "The fleet to use for this ASM installation."
  type        = string
  default     = ""
}

variable "channel" {
  description = "The channel to use for this ASM installation."
  type        = string
  validation {
    condition = anytrue([
      var.channel == "rapid",
      var.channel == "regular",
      var.channel == "stable",
      var.channel == "", // if unset, use GKE data source and use release cluster channel
    ])
    error_message = "Must be one of rapid, regular, or stable."
  }
  default = ""
}

variable "multicluster_mode" {
  description = "[Preview] Determines whether remote secrets should be autogenerated across fleet cluster."
  type        = string
  validation {
    condition = anytrue([
      var.multicluster_mode == "manual",
      var.multicluster_mode == "connected",
    ])
    error_message = "Must be one of manual or connected."
  }
  default = "manual"
}

variable "enable_cni" {
  description = "Determines whether to enable CNI for this ASM installation. Required to use Managed Data Plane (MDP)."
  type        = bool
  default     = false
}

variable "enable_vpc_sc" {
  description = "Determines whether to enable VPC-SC for this ASM installation. For more information read https://cloud.google.com/service-mesh/docs/managed/vpc-sc"
  type        = bool
  default     = false
}

variable "enable_mesh_feature" {
  description = "Determines whether the module enables the mesh feature on the fleet."
  type        = bool
  default     = false
}

variable "internal_ip" {
  description = "Use internal ip for the cluster endpoint when running kubectl commands."
  type        = bool
  default     = false
}

variable "module_depends_on" {
  description = "List of modules or resources this module depends on.  If multiple, all items must be the same type."
  type        = list(any)
  default     = []
}

variable "create_system_namespace" {
  description = "Determines whether the module creates the istio-system namespace."
  type        = bool
  default     = true
}

variable "enable_feature_asm" {
  description = "enable anthos feature anthos service mesh"
  type        = bool
  default     = true  
}
