resource "random_id" "terraform_state_suffix" {
  byte_length = 8
}

resource "digitalocean_spaces_bucket" "terraform_state" {
  name   = "terraform-state-${random_id.terraform_state_suffix.hex}"
  region = data.digitalocean_region.sydney.slug
}

resource "digitalocean_project_resources" "spaces" {
  project = digitalocean_project.environment.id

  resources = [
    digitalocean_spaces_bucket.terraform_state.urn
  ]
}
