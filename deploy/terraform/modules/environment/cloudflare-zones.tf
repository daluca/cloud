resource "cloudflare_zone" "main" {
  account_id = data.cloudflare_accounts.main.id
  zone       = var.domain
}

resource "cloudflare_zone_settings_override" "main" {
  zone_id = sensitive(cloudflare_zone.main.id)

  settings {
    always_use_https = "on"
    security_header {
      enabled            = true
      max_age            = 63072000
      include_subdomains = true
    }
  }
}
