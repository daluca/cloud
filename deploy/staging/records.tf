resource "digitalocean_record" "adminer" {
  domain = digitalocean_domain.staging.id
  type   = "CNAME"
  name   = "adminer"
  value  = "${digitalocean_domain.staging.name}."
}

resource "digitalocean_record" "miniflux" {
  domain = digitalocean_domain.staging.id
  type   = "CNAME"
  name   = "miniflux"
  value  = "${digitalocean_domain.staging.name}."
}

resource "digitalocean_record" "hangry" {
  domain = digitalocean_domain.staging.id
  type   = "CNAME"
  name   = "hangry"
  value  = "${digitalocean_domain.staging.name}."
}
