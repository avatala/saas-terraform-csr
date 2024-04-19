# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
output "google_filestore_instance" {
  description = "The details of the filestore instance"
  value       = google_filestore_instance.instance
}
