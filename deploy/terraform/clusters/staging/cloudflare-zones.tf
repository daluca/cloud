data "cloudflare_zone" "primary" {
  name = var.primary_domain
}

resource "cloudflare_zone_settings_override" "primary" {
  zone_id = data.cloudflare_zone.primary.zone_id

  settings {
    development_mode = "on"
  }
}
