terraform {
  required_version = ">= 1.0, < 1.6"

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    endpoint = "s3.ap-southeast-2.wasabisys.com"
    key      = "users/production/terraform.tfstate"
    region   = "ap-southeast-2"
    encrypt  = true

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}
