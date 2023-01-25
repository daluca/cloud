resource "digitalocean_domain" "environment" {
  name = "${lookup(local.environments, var.environment, "dev")}.${var.domain}"
}

resource "digitalocean_project_resources" "domains" {
  project = digitalocean_project.environment.id

  resources = [
    digitalocean_domain.environment.urn
  ]
}
