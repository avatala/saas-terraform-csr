# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY A HTTP LOAD BALANCER
# This module deploys a HTTP(S) Cloud Load Balancer
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

locals {
  create_http_forward = var.http_forward || var.https_redirect
}

# ------------------------------------------------------------------------------
# CREATE A PUBLIC IP ADDRESS
# ------------------------------------------------------------------------------

resource "google_compute_global_address" "admin_ip" {
  project      = var.project
  name         = var.admin_ip
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

# ------------------------------------------------------------------------------
# GOOGLE MANAGE SSL CERTIFICATE
# ------------------------------------------------------------------------------

resource "google_compute_managed_ssl_certificate" "admin_ssl" {
  project      = var.project
  name = var.admin_ssl_cert

  managed {
    domains = var.admin_hosts
  }
}

resource "google_compute_target_https_proxy" "admin_https_proxy" {
  project      = var.project
  count        = var.enable_ssl ? 1 : 0
  name         = "${var.name}-admin-https-proxy"
  url_map      = google_compute_url_map.urlmap.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.admin_ssl.id]
}


# ------------------------------------------------------------------------------
# CREATE THE URL MAP TO MAP PATHS TO BACKENDS
# ------------------------------------------------------------------------------

resource "google_compute_url_map" "urlmap" {
  project      = var.project
  name= var.lb_name
  description = "a url map for lb"
  default_service = google_compute_backend_service.admin_backend[keys(var.admin_backends)[0]].self_link

  host_rule {
    hosts        = var.admin_hosts
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.admin_backend[keys(var.admin_backends)[0]].self_link
  }
}


resource "google_compute_url_map" "nginx_https_redirect" {
  project = var.project
  count   = var.nginx_https_redirect ? 1 : 0
  #name    = "${var.name}-freemium-https-redirect"
  name    = "nginx-https-redirect-url-map"
  default_url_redirect {
    https_redirect         = true
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
    strip_query            = false
  }
}

# ------------------------------------------------------------------------------
# CREATE THE BACKEND FOR UMIG
# ------------------------------------------------------------------------------


resource "google_compute_backend_service" "admin_backend" {
  provider = google-beta
  for_each = var.admin_backends

  project = var.project
  name    = "${var.name}-admin-backend"
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  port_name                       = each.value.port_name
  protocol                        = each.value.protocol
  timeout_sec                     = lookup(each.value, "timeout_sec", null)
  description                     = lookup(each.value, "description", null)
  connection_draining_timeout_sec = lookup(each.value, "connection_draining_timeout_sec", null)
  enable_cdn                      = lookup(each.value, "enable_cdn", false)
  security_policy                 = var.security_policy
  session_affinity                = lookup(each.value, "session_affinity", null)
  affinity_cookie_ttl_sec         = lookup(each.value, "affinity_cookie_ttl_sec", null)

  dynamic "backend" {
    for_each = toset(each.value["groups"])
    content {
      balancing_mode               = lookup(backend.value, "balancing_mode")
      capacity_scaler              = lookup(backend.value, "capacity_scaler")
      description                  = lookup(backend.value, "description")
      group                        = lookup(backend.value, "group")
      max_connections              = lookup(backend.value, "max_connections")
      max_connections_per_instance = lookup(backend.value, "max_connections_per_instance")
      max_connections_per_endpoint = lookup(backend.value, "max_connections_per_endpoint")
      max_rate                     = lookup(backend.value, "max_rate")
      max_rate_per_instance        = lookup(backend.value, "max_rate_per_instance")
      max_rate_per_endpoint        = lookup(backend.value, "max_rate_per_endpoint")
      max_utilization              = lookup(backend.value, "max_utilization")
    }
  }

  log_config {
    enable      = lookup(lookup(each.value, "log_config", {}), "enable", true)
    sample_rate = lookup(lookup(each.value, "log_config", {}), "sample_rate", "1.0")
  }

  lifecycle {
    ignore_changes = [backend]
  }
}

# ------------------------------------------------------------------------------
# IF SSL ENABLED, CREATE FORWARDING RULE AND PROXY
# ------------------------------------------------------------------------------

resource "google_compute_global_forwarding_rule" "https" {
  provider              = google-beta
  project               = var.project
  count                 = var.enable_ssl ? 1 : 0
  name                  = "${var.name}-fwd-rule"
  target                = google_compute_target_https_proxy.admin_https_proxy[0].self_link
  ip_address            = google_compute_global_address.admin_ip.address
  port_range            = var.port_range
  depends_on            = [google_compute_global_address.admin_ip]
  labels                = var.custom_labels
  load_balancing_scheme = "EXTERNAL_MANAGED"
}

