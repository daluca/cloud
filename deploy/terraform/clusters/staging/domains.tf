locals {
  environments = {
    production  = "prd"
    staging     = "stg"
    development = "dev"
  }

  environment = lookup(local.environments, lower(digitalocean_project.staging.environment), "dev")
}

resource "digitalocean_domain" "staging" {
  name = "${local.environment}.${var.domain}"
}

resource "digitalocean_project_resources" "domains" {
  project = digitalocean_project.staging.id

  resources = [
    digitalocean_domain.staging.urn
  ]
}