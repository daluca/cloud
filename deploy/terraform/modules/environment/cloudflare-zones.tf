data "cloudflare_zone" "domains" {
  for_each = toset(var.cloudflare.domains)

  name = each.key
}
