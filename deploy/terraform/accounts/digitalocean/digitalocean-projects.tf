resource "digitalocean_project" "environment" {
  for_each = toset(var.environments)

  name        = title(each.key)
  description = "Hobby projects and open source software"
  purpose     = "Web Application"
  environment = title(each.key)
  # is_default  = each.key == "development" ? true : false
}
