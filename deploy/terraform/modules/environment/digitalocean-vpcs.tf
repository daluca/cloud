data "digitalocean_vpc" "environment" {
  name = "${local.environment}-network"
}
