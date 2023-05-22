locals {
  environment = lower(data.digitalocean_project.environment.name)
}

data "digitalocean_project" "environment" {
  name = title(var.digitalocean.environment)
}
