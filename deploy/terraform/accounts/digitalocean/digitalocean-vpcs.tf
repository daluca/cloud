resource "digitalocean_vpc" "environment" {
  for_each = toset(var.environments)

  name        = "${lower(each.key)}-network"
  description = "${title(each.key)} network"
  region      = data.digitalocean_region.sydney.slug
}
