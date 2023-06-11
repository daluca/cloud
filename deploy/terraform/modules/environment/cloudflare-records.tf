resource "cloudflare_record" "apex" {
  zone_id = sensitive(cloudflare_zone.main.id)
  name    = "@"
  value   = sensitive(data.digitalocean_loadbalancer.main.ip)
  type    = "A"
  proxied = true
}
