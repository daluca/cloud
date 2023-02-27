terraform {
  required_version = ">= 1.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    endpoint = "syd1.digitaloceanspaces.com"
    key      = "accounts/cloudflare/terraform.tfstate"
    region   = "ap-southeast-2" # Must be a AWS region

    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}
