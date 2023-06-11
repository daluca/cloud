data "cloudflare_zone" "primary" {
  name = var.primary_domain
}
