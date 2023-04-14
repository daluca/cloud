resource "cloudflare_zone" "tertiary_domain" {
  account_id = var.cloudflare_account_id
  zone       = var.cloudflare_domain
}

resource "cloudflare_zone_settings_override" "tertiary_domain" {
  zone_id = cloudflare_zone.tertiary_domain.id

  settings {
    always_use_https = "on"
    security_header {
      enabled            = true
      max_age            = 63072000
      include_subdomains = true
    }
  }
}
