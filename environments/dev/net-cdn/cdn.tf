# ------------------------------------------------------------------------------
# CREATE A STORAGE BUCKET
# ------------------------------------------------------------------------------
resource "random_id" "bucket_name_suffix" {
  byte_length = 3
}
resource "google_storage_bucket" "cdn_bucket" {
  name          = "cdn-bucket-${random_id.bucket_name_suffix.hex}"
  storage_class = "STANDARD"
  location      = "US"
  project       = var.project_id
}


# ------------------------------------------------------------------------------
# CREATE A BACKEND FOR CDN BUCKET
# ------------------------------------------------------------------------------

resource "google_compute_backend_bucket" "cdn_backend_bucket" {
  name                    = "cdn-backend-bucket-${random_id.bucket_name_suffix.hex}"
  description             = "Backend bucket for serving static content through CDN"
  bucket_name             = google_storage_bucket.cdn_bucket.name
  enable_cdn              = true
  compression_mode        = "AUTOMATIC"
  project                 = var.project_id
}

# ------------------------------------------------------------------------------
# CREATE AN URL MAP
# ------------------------------------------------------------------------------

resource "google_compute_url_map" "cdn_url_map" {
  name            = "cdn-url-map"
  description     = "CDN URL map to cdn_backend_bucket"
  default_service = google_compute_backend_bucket.cdn_backend_bucket.self_link
  project         = var.project_id
}

# ------------------------------------------------------------------------------
# CREATE A GLOBAL PUBLIC IP ADDRESS AND DNS POINTER
# ------------------------------------------------------------------------------
resource "random_id" "public_ip_name_suffix" {
  byte_length = 3
}
resource "google_compute_global_address" "cdn_public_address" {
  name         = "cdn-public-address-${random_id.public_ip_name_suffix.hex}"
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
  project      = var.host_project_id
}

resource "google_dns_record_set" "cdn" {
  managed_zone = "cdn.cloudon.one."
  name         = "${local.cdn_domain}."
  type         = "A"
  ttl          = 3600 # 1 hour
  rrdatas      = [google_compute_global_address.cdn_public_address.address]
  project      = var.host_project_id
}

locals {
  cdn_domain = "cdn.dev.cloudon.one."
}
# ------------------------------------------------------------------------------
# CREATE A GLOBAL FORWARDING RULE
# ------------------------------------------------------------------------------

resource "google_compute_global_forwarding_rule" "cdn_global_forwarding_rule" {
  name       = "cdn-global-forwarding-https-rule"
  target     = google_compute_target_https_proxy.cdn_https_proxy.self_link
  ip_address = google_compute_global_address.cdn_public_address.address
  port_range = "443"
  project    = var.project_id
}
# ------------------------------------------------------------------------------
# CREATE A GOOGLE COMPUTE MANAGED CERTIFICATE
# ------------------------------------------------------------------------------
resource "google_compute_managed_ssl_certificate" "cdn_certificate" {
  name     = "cdn-dev-cert"
  project  = var.project_id
  provider = google-beta

  managed {
    domains = [local.cdn_domain]
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ------------------------------------------------------------------------------
# CREATE HTTPS PROXY
# ------------------------------------------------------------------------------

resource "google_compute_target_https_proxy" "cdn_https_proxy" {
  name             = "cdn-https-proxy"
  url_map          = google_compute_url_map.cdn_url_map.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.cdn_certificate.self_link]
  project          = var.project_id
}

# ------------------------------------------------------------------------------
# MAKE THE BUCKET PUBLIC
# ------------------------------------------------------------------------------

resource "google_storage_bucket_iam_member" "all_users_viewers" {
  bucket = google_storage_bucket.cdn_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.cdn_bucket.id
  role   = "READER"
  entity = "allUsers"
}