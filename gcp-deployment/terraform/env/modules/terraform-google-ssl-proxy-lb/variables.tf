# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project" {
  description = "The project ID to create the resources in."
  type        = string
}

variable "name" {
  description = "Name for the load balancer forwarding rule and prefix for supporting resources."
  type        = string
}

variable "freemium_static_ip"{
  type        = string
  description = "Name of the external-ip. the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])?"
}

variable "enterprise_static_ip"{
  type        = string
  description = "Name of the external-ip. the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])?"
}

variable "freemium_certificate_map" {
  description = "ID of the certificate map"  
}

variable "enterprise_certificate_map" {
  description = "ID of the certificate map"  
}

variable "mig_id" {
  description = "self link of mig group"
}

variable "hc_port" {
  description = "Port of Heath check"
}

variable "application_port" {
  description = "application port"
}