# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


resource "google_compute_global_address" "tcp_freemium_ip" {
  provider = google-beta
  name     = var.freemium_static_ip
  project = var.project
}

resource "google_compute_global_address" "tcp_enterprise_ip" {
  provider = google-beta
  name     = var.enterprise_static_ip
  project = var.project
}

# forwarding rule
resource "google_compute_global_forwarding_rule" "freemium_fr" {
  name                  = "${var.name}-freemium-fwd-rule-tcp"
  project               = var.project
  provider              = google-beta
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = var.application_port
  target                = google_compute_target_ssl_proxy.freemium_ssl.id #google_compute_target_tcp_proxy.freemium.id
  ip_address            = google_compute_global_address.tcp_freemium_ip.id
}

resource "google_compute_global_forwarding_rule" "enterprise_fw" {
  name                  = "${var.name}-enterprise-fwd-rule-tcp"
  project               = var.project
  provider              = google-beta
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = var.application_port
  target                = google_compute_target_ssl_proxy.enterprise_ssl.id  #google_compute_target_tcp_proxy.enterprise.id
  ip_address            = google_compute_global_address.tcp_enterprise_ip.id
}


resource "google_compute_target_ssl_proxy" "freemium_ssl" {
  project         = var.project
  provider        = google-beta
  name            = "${var.name}-freemium-ssl-proxy"
  backend_service = google_compute_backend_service.freemium_backend.id
  certificate_map = "//certificatemanager.googleapis.com/${var.freemium_certificate_map}"
}

resource "google_compute_target_ssl_proxy" "enterprise_ssl" {
  project         = var.project
  provider        = google-beta
  name            = "${var.name}-enterprise-ssl-proxy"
  backend_service = google_compute_backend_service.freemium_backend.id
  certificate_map = "//certificatemanager.googleapis.com/${var.enterprise_certificate_map}"
}

# backend service
resource "google_compute_backend_service" "freemium_backend" {
  provider              = google-beta
  project              = var.project
  name                  = "${var.name}-tcp-backend"
  protocol              = "TCP"
  port_name             = "tcp"
  load_balancing_scheme = "EXTERNAL"
  timeout_sec           = 10
  health_checks         = [google_compute_health_check.freemium_hc.id]
  backend {
    group           = var.mig_id
    balancing_mode  = "UTILIZATION"
    max_utilization = 1.0
    capacity_scaler = 1.0
  }
}

resource "google_compute_health_check" "freemium_hc" {
  provider           = google-beta
  project           = var.project
  name               = "${var.name}-tcp-healthcheck"
  timeout_sec        = 1
  check_interval_sec = 1

  tcp_health_check {
    port = var.hc_port
  }
}