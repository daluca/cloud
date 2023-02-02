data "digitalocean_loadbalancer" "staging" {
  name = lower(digitalocean_project.staging.name)
}
