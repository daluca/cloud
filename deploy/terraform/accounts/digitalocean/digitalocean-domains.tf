resource "digitalocean_domain" "environment" {
  for_each = toset(var.environments)

  name = each.key == "production" ? var.domain : "${lookup(local.environments, each.key, "expect valid environment")}.${var.domain}"
}

resource "digitalocean_project_resources" "environment" {
  for_each = toset(var.environments)

  project = digitalocean_project.environment[each.key].id

  resources = [
    digitalocean_domain.environment[each.key].urn
  ]
}
