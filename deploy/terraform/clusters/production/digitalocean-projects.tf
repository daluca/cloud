data "digitalocean_project" "production" {
  name = title(var.environment)
}
