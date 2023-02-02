locals {
  loadbalancer_ip_address = sensitive(data.digitalocean_loadbalancer.staging.ip)
}

data "digitalocean_loadbalancer" "staging" {
  name = lower(digitalocean_project.staging.name)
}
