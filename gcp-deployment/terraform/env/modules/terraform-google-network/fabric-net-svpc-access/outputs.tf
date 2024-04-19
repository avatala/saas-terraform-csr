# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "service_projects" {
  description = "Project ids of the services with access to all subnets."
  value = [
    for i, k in google_compute_shared_vpc_service_project.projects : k.service_project
  ]
}
