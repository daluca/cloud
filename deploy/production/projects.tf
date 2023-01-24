resource "digitalocean_project" "environment" {
  name        = title(var.environment)
  description = "${title(var.environment)} environment for applications."
  purpose     = "Web Application"
  environment = title(var.environment)
  is_default  = false
}
