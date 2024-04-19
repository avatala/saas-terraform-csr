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

resource "google_compute_global_address" "freemium_ip" {
  project      = var.project
  name         = var.freemium_static_ip
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

resource "google_compute_global_address" "enterprise_ip" {
  project      = var.project
  name         = var.enterprise_static_ip
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

resource "google_compute_global_address" "admin_ip" {
  project      = var.project
  name         = var.admin_ip
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

resource "google_compute_global_address" "master_cf_ip" {
  project      = var.project
  name         = var.master_cf_ip
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

resource "google_compute_global_address" "email_verification_ip" {
  project      = var.project
  name         = var.email_verification_ip
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

resource "google_compute_global_address" "gcip_ip" {
  project      = var.project
  name         = var.gcip_ip
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

resource "google_compute_managed_ssl_certificate" "email_verification_ssl" {
  project      = var.project
  name = var.email_verification_cert

  managed {
    domains = var.email_verification
  }
}

resource "google_compute_managed_ssl_certificate" "master_cf_ssl" {
  project      = var.project
  name = var.master_cf_cert

  managed {
    domains = var.master_cf
  }
}

resource "google_compute_managed_ssl_certificate" "gcip_ssl" {
  project      = var.project
  name = var.gcip_cert

  managed {
    domains = var.gcip
  }
}

resource "google_compute_target_https_proxy" "freemium_https_proxy" {
  project      = var.project
  count        = var.enable_ssl ? 1 : 0
  name         = "${var.name}-freemium-https-proxy"
  url_map      = google_compute_url_map.urlmap.self_link
  certificate_map = "//certificatemanager.googleapis.com/${var.freemium_certificate_map}"
}

resource "google_compute_target_https_proxy" "enterprise_https_proxy" {
  project      = var.project
  count        = var.enable_ssl ? 1 : 0
  name         = "${var.name}-enterprise-https-proxy"
  url_map      = google_compute_url_map.urlmap.self_link
  certificate_map = "//certificatemanager.googleapis.com/${var.enterprise_certificate_map}"
}

resource "google_compute_target_https_proxy" "admin_https_proxy" {
  project      = var.project
  count        = var.enable_ssl ? 1 : 0
  name         = "${var.name}-admin-https-proxy"
  url_map      = google_compute_url_map.urlmap.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.admin_ssl.id]
}

resource "google_compute_target_https_proxy" "master_cf_https_proxy" {
  project      = var.project
  count        = var.enable_ssl ? 1 : 0
  name         = "${var.name}-master-cf-https-proxy"
  url_map      = google_compute_url_map.urlmap.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.master_cf_ssl.id]
}

resource "google_compute_target_https_proxy" "email_verification_https_proxy" {
  project      = var.project
  count        = var.enable_ssl ? 1 : 0
  name         = "${var.name}-email-verification-https-proxy"
  url_map      = google_compute_url_map.urlmap.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.email_verification_ssl.id]
}

resource "google_compute_target_https_proxy" "gcip_https_proxy" {
  project      = var.project
  count        = var.enable_ssl ? 1 : 0
  name         = "${var.name}-gcip-https-proxy"
  url_map      = google_compute_url_map.urlmap.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.gcip_ssl.id]
}

# HTTP proxy when http forwarding is true
resource "google_compute_target_http_proxy" "freemium_http_proxy" {
  project = var.project
  count   = local.create_http_forward ? 1 : 0
  name    = "${var.name}-freemium-http-proxy"
  url_map = google_compute_url_map.nginx_https_redirect[0].self_link
}

resource "google_compute_target_http_proxy" "enterprise_http_proxy" {
  project = var.project
  count   = local.create_http_forward ? 1 : 0
  name    = "${var.name}-enterprise-http-proxy"
  url_map = google_compute_url_map.nginx_https_redirect[0].self_link
}

# ------------------------------------------------------------------------------
# CREATE THE URL MAP TO MAP PATHS TO BACKENDS
# ------------------------------------------------------------------------------

resource "google_compute_url_map" "urlmap" {
  project      = var.project
  name= var.lb_name
  description = "a url map for lb"
  default_service = google_compute_backend_service.default[keys(var.backends)[0]].self_link

  host_rule {
    hosts        = var.admin_hosts
    path_matcher = "allpaths"
  }

  host_rule {
    hosts        = var.email_verification
    path_matcher = "email-verification"
  }
  
  host_rule {
    hosts        = var.master_cf
    path_matcher = "master-cf"
  }

  host_rule {
    hosts        = var.gcip
    path_matcher = "gcip"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.admin_backend[keys(var.admin_backends)[0]].self_link
  }
  path_matcher {
    name            = "email-verification"
    default_service = google_compute_backend_service.admin_backend[keys(var.admin_backends)[1]].self_link
  }
  path_matcher {
    name            = "master-cf"
    default_service = google_compute_backend_service.admin_backend[keys(var.admin_backends)[3]].self_link
  }
  path_matcher {
    name            = "gcip"
    default_service = google_compute_backend_service.admin_backend[keys(var.admin_backends)[2]].self_link
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


resource "google_compute_backend_service" "admin_backend" {
  provider = google-beta
  for_each = var.admin_backends

  project = var.project
  name    = "${var.name}-admin-backends-${each.key}"
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

resource "google_compute_global_forwarding_rule" "freemium_https" {
  provider   = google-beta
  project    = var.project
  count      = var.enable_ssl ? 1 : 0
  name       = "${var.name}-freemium-fwd-rule-https"
  target     = google_compute_target_https_proxy.freemium_https_proxy[0].self_link
  ip_address = google_compute_global_address.freemium_ip.address
  port_range = var.port_range
  depends_on = [google_compute_global_address.freemium_ip]
  labels = var.custom_labels
  load_balancing_scheme  = "EXTERNAL_MANAGED"
}

resource "google_compute_global_forwarding_rule" "enterprise_https" {
  provider   = google-beta
  project    = var.project
  count      = var.enable_ssl ? 1 : 0
  name       = "${var.name}-enterprise-fwd-rule-https"
  target     = google_compute_target_https_proxy.enterprise_https_proxy[0].self_link
  ip_address = google_compute_global_address.enterprise_ip.address
  port_range = var.port_range
  depends_on = [google_compute_global_address.enterprise_ip]
  labels = var.custom_labels
  load_balancing_scheme  = "EXTERNAL_MANAGED"
}

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

resource "google_compute_global_forwarding_rule" "master_cf_https" {
  provider              = google-beta
  project               = var.project
  count                 = var.enable_ssl ? 1 : 0
  name                  = "${var.name}-master-cf-fwd-rule"
  target                = google_compute_target_https_proxy.master_cf_https_proxy[0].self_link
  ip_address            = google_compute_global_address.master_cf_ip.address
  port_range            = var.port_range
  depends_on            = [google_compute_global_address.master_cf_ip]
  labels                = var.custom_labels
  load_balancing_scheme = "EXTERNAL_MANAGED"
}

resource "google_compute_global_forwarding_rule" "email_verification_https" {
  provider              = google-beta
  project               = var.project
  count                 = var.enable_ssl ? 1 : 0
  name                  = "${var.name}-ev-fwd-rule"
  target                = google_compute_target_https_proxy.email_verification_https_proxy[0].self_link
  ip_address            = google_compute_global_address.email_verification_ip.address
  port_range            = var.port_range
  depends_on            = [google_compute_global_address.email_verification_ip]
  labels                = var.custom_labels
  load_balancing_scheme = "EXTERNAL_MANAGED"
}

resource "google_compute_global_forwarding_rule" "gcip_https" {
  provider              = google-beta
  project               = var.project
  count                 = var.enable_ssl ? 1 : 0
  name                  = "${var.name}-gcip-fwd-rule"
  target                = google_compute_target_https_proxy.gcip_https_proxy[0].self_link
  ip_address            = google_compute_global_address.gcip_ip.address
  port_range            = var.port_range
  depends_on            = [google_compute_global_address.gcip_ip]
  labels                = var.custom_labels
  load_balancing_scheme = "EXTERNAL_MANAGED"
}

## IPv4 block ###
resource "google_compute_global_forwarding_rule" "freemium_http" {
  provider   = google-beta
  project    = var.project
  count      = local.create_http_forward ? 1 : 0
  name       = "${var.name}-freemium-fwd-http"
  target     = google_compute_target_http_proxy.freemium_http_proxy[0].self_link
  ip_address = google_compute_global_address.freemium_ip.address
  depends_on = [google_compute_global_address.freemium_ip]
  port_range = "80"
  load_balancing_scheme  = "EXTERNAL_MANAGED"
}

resource "google_compute_global_forwarding_rule" "enterprise_http" {
  provider   = google-beta
  project    = var.project
  count      = local.create_http_forward ? 1 : 0
  name       = "${var.name}-enterprise-fwd-http"
  target     = google_compute_target_http_proxy.enterprise_http_proxy[0].self_link
  ip_address = google_compute_global_address.enterprise_ip.address
  depends_on = [google_compute_global_address.enterprise_ip]
  port_range = "80"
  load_balancing_scheme  = "EXTERNAL_MANAGED"
}

