locals {
  matrix_domain = local.environment == "staging" ? var.cloudflare.domains[0] : var.cloudflare.domains[1]
}

resource "cloudflare_record" "apex" {
  for_each = toset(var.cloudflare.domains)

  zone_id = sensitive(data.cloudflare_zone.domains[each.key].id)
  name    = "@"
  content = sensitive(data.digitalocean_loadbalancer.main.ip)
  type    = "A"
  proxied = true
}
