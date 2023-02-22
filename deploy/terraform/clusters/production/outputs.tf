output "terraform_state_bucket" {
  description = "DigitalOcean spaces name for the terraform state bucket."
  value       = digitalocean_spaces_bucket.terraform_state.name
  sensitive   = true
}