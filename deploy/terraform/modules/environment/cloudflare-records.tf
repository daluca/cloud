locals {
  matrix_domain = local.environment == "staging" ? var.cloudflare.domains[0] : var.cloudflare.domains[1]
}

resource "cloudflare_record" "apex" {
  for_each = toset(var.cloudflare.domains)

  zone_id = sensitive(data.cloudflare_zone.domains[each.key].id)
  name    = "@"
  value   = sensitive(data.digitalocean_loadbalancer.main.ip)
  type    = "A"
  proxied = each.key != local.matrix_domain ? true : false
}

resource "cloudflare_record" "matrix_srv" {
  zone_id = sensitive(data.cloudflare_zone.domains[local.matrix_domain].id)
  name    = "@"
  type    = "SRV"

  data {
    service  = "_matrix"
    proto    = "_tcp"
    name     = data.cloudflare_zone.domains[local.matrix_domain].name
    priority = 10
    weight   = 0
    port     = 443
    target   = "matrix.${data.cloudflare_zone.domains[local.matrix_domain].name}"
  }
}
