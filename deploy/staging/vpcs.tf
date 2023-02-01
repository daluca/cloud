resource "digitalocean_vpc" "staging" {
  name        = "${lower(digitalocean_project.staging.name)}-network"
  description = "${title(digitalocean_project.staging.name)} network"
  region      = data.digitalocean_region.sydney.slug
}

resource "time_sleep" "wait_2_minutes" {
  depends_on = [digitalocean_vpc.staging]

  destroy_duration = "2m"
}
