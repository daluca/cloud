terraform {
  required_version = ">= 1.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    endpoint = "object-storage.nz-wlg-2.catalystcloud.io"
    key      = "accounts/cloudflare/terraform.tfstate"
    region   = "us-east-1" # Must be an AWS region

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}
