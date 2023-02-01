resource "digitalocean_project" "staging" {
  name        = title(var.environment)
  description = "Hobby projects and open source software"
  purpose     = "Web Application"
  environment = title(var.environment)
}
