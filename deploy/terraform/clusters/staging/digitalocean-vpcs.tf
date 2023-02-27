resource "digitalocean_vpc" "staging" {
  name        = "${lower(digitalocean_project.staging.name)}-network"
  description = "${title(digitalocean_project.staging.name)} network"
  region      = data.digitalocean_region.sydney.slug
}
