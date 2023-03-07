terraform {
  required_version = ">= 1.0"

  required_providers {
    wasabi = {
      source  = "terrabitz/wasabi"
      version = "~> 4.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    endpoint = "object-storage.nz-wlg-2.catalystcloud.io"
    key      = "accounts/wasabi/terraform.tfstate"
    region   = "us-east-1" # Must be an AWS region

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}

provider "wasabi" {
  region = "us-east-1"
}

provider "aws" {
  region = "us-east-1"

  s3_use_path_style = true

  endpoints {
    sts = "https://sts.wasabisys.com"
    iam = "https://iam.wasabisys.com"
    s3  = "https://s3.wasabisys.com"
  }
}
