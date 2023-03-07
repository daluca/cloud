terraform {
  required_version = ">= 1.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    endpoint = "object-storage.nz-wlg-2.catalystcloud.io"
    key      = "accounts/digitalocean/terraform.tfstate"
    region   = "us-east-1" # Must be an AWS region

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}
