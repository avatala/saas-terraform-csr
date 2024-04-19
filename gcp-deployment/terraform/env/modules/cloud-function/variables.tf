# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

#Cloud Function Details
variable "project_id" {
  description = "Project ID to create Cloud Function"
  type        = string
}

variable "function_region" {
  description = "The location of this cloud function"
  type        = string
}

variable "environment_variables" {
  type        = map(string)
  default     = {}
  description = "A set of key/value environment variable pairs to assign to the function."
}

variable "function_name" {
  description = "A user-defined name of the function"
  type        = string
}

variable "function_description" {
  description = "Short description of the function"
  type        = string
  default     = null
}

variable "runtime" {
  description = "The runtime in which to run the function."
  type        = string
}

variable "entrypoint" {
  description = "The name of the function (as defined in source code) that will be executed. Defaults to the resource name suffix, if not specified"
  type        = string
}
variable "function_timeout" {
  type        = string
  default     = 30
  description = "Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds"
}

variable "max_instance_count" {
  type        = string
  default     = "100"
  description = "The limit on the maximum number of function instances that may coexist at a given time"
}

variable "min_instance_count" {
  type        = string
  default     = "0"
  description = "The limit on the minimum number of function instances that may coexist at a given time"
}
variable "function_memory" {
  type        = string
  default     = ""
  description = "Memory (in MB), available to the function. Allowed values are: 128MB, 256MB, 512MB, 1024MB, and 2048MB"
}

variable "available_cpu" {
  type        = string
  default     = 1
  description = " The number of CPUs used in a single container instance. Default value is calculated from available memory."
  
}


# BUCKET

variable "bucket_name" {
  type        = string
  description = "The name of the containing bucket"
}

variable "object_name" {
  type        = string
  description = "The name of the object"
}



#Ingress and VPC Connector
variable "vpc_connector_egress_settings" {
    type        = string
  default     = null
  description = "The egress settings for the connector, controlling what traffic is diverted through it. Allowed values are ALL_TRAFFIC and PRIVATE_RANGES_ONLY. If unset, this field preserves the previously set value."
}

variable "ingress_settings" {
type        = string
  default     = "ALLOW_ALL"
  description = "The ingress settings for the function. Allowed values are ALLOW_ALL, ALLOW_INTERNAL_AND_GCLB and ALLOW_INTERNAL_ONLY. Changes to this field will recreate the cloud function."
}

variable "vpc_connector" {
    type        = string
  default     = null
  description = "The VPC Network Connector that this cloud function can connect to. It should be set up as fully-qualified URI. The format of this field is projects/*/locations/*/connectors/*."
}

#SA
variable "service_account_email" {
  type        = string
  description = "If provided, the self-provided service account to run the function with."
  default     = ""
  
}

variable "authentication"{
  description = "Cloud Function Authentication policy"
  type        = string
}

variable "role"{
  description = "Cloud Functin role"
  type        = string
}