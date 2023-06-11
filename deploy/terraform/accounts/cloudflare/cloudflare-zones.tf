resource "cloudflare_zone" "primary" {
  account_id = var.cloudflare_account_id
  zone       = var.primary_domain
}

resource "cloudflare_zone" "secondary" {
  account_id = var.cloudflare_account_id
  zone       = var.secondary_domain
}

resource "cloudflare_zone" "tertiary" {
  account_id = var.cloudflare_account_id
  zone       = var.tertiary_domain
}

resource "cloudflare_zone" "staging" {
  account_id = var.cloudflare_account_id
  zone       = var.staging_domain
}

resource "cloudflare_zone_settings_override" "primary" {
  zone_id = sensitive(cloudflare_zone.primary.id)

  settings {
    always_use_https = "on"
    security_header {
      enabled            = true
      max_age            = 63072000
      include_subdomains = true
    }
  }
}

resource "cloudflare_zone_settings_override" "secondary" {
  zone_id = sensitive(cloudflare_zone.secondary.id)

  settings {
    always_use_https = "on"
    security_header {
      enabled            = true
      max_age            = 63072000
      include_subdomains = true
    }
  }
}

resource "cloudflare_zone_settings_override" "tertiary" {
  zone_id = sensitive(cloudflare_zone.tertiary.id)

  settings {
    always_use_https = "on"
    security_header {
      enabled            = true
      max_age            = 63072000
      include_subdomains = true
    }
  }
}

resource "cloudflare_zone_settings_override" "staging" {
  zone_id = sensitive(cloudflare_zone.staging.id)

  settings {
    always_use_https = "on"
    security_header {
      enabled            = true
      max_age            = 63072000
      include_subdomains = true
    }
  }
}
