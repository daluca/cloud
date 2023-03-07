data "digitalocean_vpc" "staging" {
  name = "${lower(data.digitalocean_project.staging.name)}-network"
}
