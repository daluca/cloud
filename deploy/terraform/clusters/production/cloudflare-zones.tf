data "cloudflare_zone" "primary" {
  name = var.primary_domain
}

data "cloudflare_zone" "secondary" {
  name = var.secondary_domain
}
