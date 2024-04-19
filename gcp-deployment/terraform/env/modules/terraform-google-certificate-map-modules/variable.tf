# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
variable "project_id" {
  description = "The GCP project ID"
  default = ""
}

 variable "cert_map_name" {
   description = "A user-defined name of the Certificate Map"
   type = string
   default = ""

 }

 variable "cert_map_labels" {
   description = "Set of labels associated with a Certificate Map resource"
   type = map
   default = {
      "terraform" : true,
      "acc-test"  : true,
   }
 }

 variable "cert_map_name_entry" {
   description = "A user-defined name of the Certificate Map Entry"
   type = string
 }
variable "certificates" {
  default = ""
  
}
