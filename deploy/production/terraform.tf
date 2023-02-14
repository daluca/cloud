terraform {
  required_version = ">= 1.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    endpoint = "syd1.digitaloceanspaces.com"
    key      = "production/terraform.tfstate"
    region   = "ap-southeast-2" # Must be an AWS region

    skip_credentials_validation = true
  }
}
