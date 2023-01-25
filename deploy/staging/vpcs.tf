resource "digitalocean_vpc" "environment" {
  name        = "${var.environment}-network"
  description = "${title(var.environment)} network"
  region      = data.digitalocean_region.sydney.slug
}

resource "time_sleep" "wait_2_minutes" {
  depends_on       = [digitalocean_vpc.environment]
  destroy_duration = "2m"
}
