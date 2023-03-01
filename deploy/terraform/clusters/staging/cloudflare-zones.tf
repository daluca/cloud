resource "cloudflare_zone" "tertiary_domain" {
  account_id = var.cloudflare_account_id
  zone       = var.cloudflare_domain
}
