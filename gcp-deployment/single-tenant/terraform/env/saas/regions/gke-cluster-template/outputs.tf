# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  GKE Cluster Outputs
 *****************************************/

output "main_vpc_gke_private_clusters" {
  description = "The details of the created GKE Clusters."
  value       = module.main_vpc_gke_private_clusters
}