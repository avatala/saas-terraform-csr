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

# ------------------------------------------------------------------------------
# CREATE A PUBLIC IP ADDRESS
# ------------------------------------------------------------------------------

resource "google_compute_global_address" "apigee_ip" {
  project      = var.project
  name         = var.apigee_static_ip
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
  depends_on = [google_compute_backend_service.default]
}

# ------------------------------------------------------------------------------
# GOOGLE MANAGE SSL CERTIFICATE
# ------------------------------------------------------------------------------

resource "google_compute_managed_ssl_certificate" "apigee_ssl" {
  project      = var.project
  name = var.apigee_ssl_cert

  managed {
    domains = var.apigee_hosts
  }
 depends_on = [google_compute_global_address.apigee_ip]
}

resource "google_compute_target_https_proxy" "default" {
  project          = var.project
  name             = "${var.name}-target-proxy"
  ssl_certificates = [google_compute_managed_ssl_certificate.apigee_ssl.id]
  url_map          = google_compute_url_map.url_map.id
}

# ------------------------------------------------------------------------------
# CREATE THE URL MAP TO MAP PATHS TO BACKENDS
# ------------------------------------------------------------------------------

resource "google_compute_url_map" "url_map" {
  project         = var.project
  name            = var.name
  default_service = google_compute_backend_service.default[keys(var.backends)[0]].id
}

# ------------------------------------------------------------------------------
# CREATE THE BACKEND FOR UMIG
# ------------------------------------------------------------------------------

resource  "google_compute_backend_service" "default" {
  provider                        = google-beta
  for_each                        = var.backends
  project                         = var.project
  name                            = "${var.name}-backend"
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  port_name                       = each.value.port_name
  protocol                        = each.value.protocol
  timeout_sec                     = lookup(each.value, "timeout_sec", null)
  description                     = lookup(each.value, "description", null)
  connection_draining_timeout_sec = lookup(each.value, "connection_draining_timeout_sec", null)
  security_policy                 = var.security_policy
  health_checks                   = [google_compute_health_check.default[each.key].self_link]
  session_affinity                = lookup(each.value, "session_affinity", null)
  locality_lb_policy              = lookup(each.value, "locality_lb_policy", null)
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
  dynamic "iap" {
    for_each = lookup(lookup(each.value, "iap_config", {}), "enable", false) ? [1] : []
    content {
      oauth2_client_id     = lookup(lookup(each.value, "iap_config", {}), "oauth2_client_id", "")
      oauth2_client_secret = lookup(lookup(each.value, "iap_config", {}), "oauth2_client_secret", "")
    }
  }


  depends_on = [google_compute_health_check.default]

  lifecycle {
    ignore_changes = [backend]
  }
}

resource "google_compute_health_check" "default" {
  provider            = google-beta
  for_each            = var.backends
  project             = var.project
  name                = "${var.name}-hc"

  check_interval_sec  = lookup(each.value["health_check"], "check_interval_sec", 5)
  timeout_sec         = lookup(each.value["health_check"], "timeout_sec", 5)
  healthy_threshold   = lookup(each.value["health_check"], "healthy_threshold", 2)
  unhealthy_threshold = lookup(each.value["health_check"], "unhealthy_threshold", 2)

  log_config {
    enable = lookup(each.value["health_check"], "logging", false)
  }

  dynamic "http_health_check" {
    for_each = each.value["protocol"] == "HTTP" ? [
      {
        host         = lookup(each.value["health_check"], "host", null)
        request_path = lookup(each.value["health_check"], "request_path", null)
        port         = lookup(each.value["health_check"], "port", null)
        proxy_header = lookup(each.value["health_check"], "proxy_header", null)
        response     = lookup(each.value["health_check"], "response", null)
      }
    ] : []

    content {
      host         = lookup(http_health_check.value, "host", null)
      request_path = lookup(http_health_check.value, "request_path", null)
      port         = lookup(http_health_check.value, "port", null)
      proxy_header = lookup(http_health_check.value, "proxy_header", null)
      response     = lookup(http_health_check.value, "response", null)
    }
  }

  dynamic "https_health_check" {
    for_each = each.value["protocol"] == "HTTPS" ? [
      {
        host         = lookup(each.value["health_check"], "host", null)
        request_path = lookup(each.value["health_check"], "request_path", null)
        port         = lookup(each.value["health_check"], "port", null)
      }
    ] : []

    content {
      host         = lookup(https_health_check.value, "host", null)
      request_path = lookup(https_health_check.value, "request_path", null)
      port         = lookup(https_health_check.value, "port", null)
    }
  }

  dynamic "http2_health_check" {
    for_each = each.value["protocol"] == "HTTP2" ? [
      {
        host         = lookup(each.value["health_check"], "host", null)
        request_path = lookup(each.value["health_check"], "request_path", null)
        port         = lookup(each.value["health_check"], "port", null)
      }
    ] : []

    content {
      host         = lookup(http2_health_check.value, "host", null)
      request_path = lookup(http2_health_check.value, "request_path", null)
      port         = lookup(http2_health_check.value, "port", null)
    }
  }
}


# ------------------------------------------------------------------------------
# IF SSL ENABLED, CREATE FORWARDING RULE AND PROXY
# ------------------------------------------------------------------------------

resource "google_compute_global_forwarding_rule" "https" {
  provider              = google-beta
  project               = var.project
  name                  = "${var.name}-fwd-rule"
  target                = google_compute_target_https_proxy.default.self_link
  ip_address            = google_compute_global_address.apigee_ip.address
  port_range            = var.port_range
  depends_on            = [google_compute_global_address.apigee_ip]
  labels                = var.custom_labels
  load_balancing_scheme = "EXTERNAL_MANAGED"
}


