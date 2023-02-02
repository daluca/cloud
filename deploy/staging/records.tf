resource "digitalocean_record" "podinfo" {
  domain = digitalocean_domain.staging.id
  type   = "CNAME"
  name   = "podinfo"
  value  = "${digitalocean_domain.staging.name}."
}
