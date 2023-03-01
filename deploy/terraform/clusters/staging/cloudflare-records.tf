resource "cloudflare_record" "apex" {
  zone_id = cloudflare_zone.tertiary_domain.id
  name    = "@"
  value   = sensitive(data.digitalocean_loadbalancer.staging.ip)
  type    = "A"
  proxied = true
}
