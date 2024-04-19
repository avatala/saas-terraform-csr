# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
resource "google_certificate_manager_dns_authorization" "default" {
  name        = var.dnsauth_name
  description = "The dns authorization required by the domain"
  domain      = var.domain
  project     = var.project_id
}

resource "google_dns_record_set" "cname" {
  project      = var.project_id
  name         = google_certificate_manager_dns_authorization.default.dns_resource_record.0.name
  managed_zone = var.managed_zone
  type         = var.type
  ttl          = 300
  rrdatas      = [google_certificate_manager_dns_authorization.default.dns_resource_record.0.data]
  depends_on = [
    google_certificate_manager_dns_authorization.default
  ]
}

resource "google_certificate_manager_certificate" "default" {
  project     = var.project_id
  name        = var.cert_name
  description = "The google certficate manager which is used to create certificates"
  scope       = "DEFAULT"
  depends_on = [
    google_dns_record_set.cname
  ]
  managed {
    domains            = var.cert_domain
    dns_authorizations = [google_certificate_manager_dns_authorization.default.id]
  }
}
