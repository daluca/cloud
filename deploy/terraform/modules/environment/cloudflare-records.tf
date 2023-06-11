resource "cloudflare_record" "apex" {
  for_each = toset(var.cloudflare.domains)

  zone_id = sensitive(data.cloudflare_zone.domains[each.key].id)
  name    = "@"
  value   = sensitive(data.digitalocean_loadbalancer.main.ip)
  type    = "A"
  proxied = true
}
