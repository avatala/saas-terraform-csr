# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_id" {
    description = "Name of the Project ID"
    type = string
}

variable "region_name" {
    description = "Name of the Region for deployment"
    type= string    
}

# variable "cloudsql_name" {
#     description = "Name of the connection"
#     type= string    
# }

/* variable "serverless_vpc_connector_name" {
    description = "Name of the serverless vpc connector"
    type= set(string)
} */


variable "cloudrun_access" {
    default = "allUsers"
    type        = string
}

variable "cloudrun_service_config" {
     description = "Configurations for cloud run services"
}

variable "limits_cpu" {
    description = "Limits for CPU"
     default = "2000m" 
     type        = string
}

variable "limits_memory" {
    description = "Limits for Memory"
     default = "2048Mi"
     type        = string
}

variable "requests_cpu" {
    description = "Requests for CPU"
     default = "1000m"
     type        = string
}

variable "requests_memory" {
    description = "Requests for Memory"
     default = "1048Mi"
     type        = string
}

variable "container_port" {
    description = "Port number the container listens on. This must be a valid port number, 0 < x < 65536."
    # default = "3000" 
    type        = string
}

/** Resources **/

variable "cpu_limits" {
    description = "The maximum amount of compute cpu limit allowed."
    default = "1000m" 
    type        = string
}

variable "memory_limits" {
    description = "The maximum amount of compute memory limit allowed."
    default = "128Mi" 
    type        = string
}

variable "cpu_requests" {
    description = "Minimum amount of compute cpu required"
    default = "100m" 
    type        = string
}

variable "memory_requests" {
    description = "Minimum amount of compute memory required"
    default = "128Mi" 
    type        = string
}

variable "member" {
  type        = string
}

variable "ingress_type" {
  type        = string
}