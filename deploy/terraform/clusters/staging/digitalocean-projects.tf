data "digitalocean_project" "staging" {
  name = title(var.environment)
}
