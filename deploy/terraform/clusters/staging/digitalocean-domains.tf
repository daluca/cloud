data "digitalocean_domain" "staging" {
  name = "stg.${var.domain}"
}
