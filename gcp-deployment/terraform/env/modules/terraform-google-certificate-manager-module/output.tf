# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
output "record_name_to_insert" {
 value = google_certificate_manager_dns_authorization.default.dns_resource_record.0.name
}

output "record_type_to_insert" {
 value = google_certificate_manager_dns_authorization.default.dns_resource_record.0.type
}

output "record_data_to_insert" {
 value = google_certificate_manager_dns_authorization.default.dns_resource_record.0.data
}

output "certificates" {
    value = google_certificate_manager_certificate.default.id
  
}