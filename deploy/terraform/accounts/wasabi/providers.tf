terraform {
  required_version = ">= 1.0, < 1.6"

  required_providers {
    wasabi = {
      source  = "thesisedu/wasabi"
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
    endpoint = "s3.ap-southeast-2.wasabisys.com"
    key      = "accounts/wasabi/terraform.tfstate"
    region   = "ap-southeast-2"
    encrypt  = true

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}

provider "wasabi" {
  region = "us-east-1"
}

provider "wasabi" {
  alias  = "sydney"
  region = "ap-southeast-2"
}

provider "aws" {
  region = "us-east-1"

  s3_use_path_style           = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    sts = "https://sts.wasabisys.com"
    iam = "https://iam.wasabisys.com"
    s3  = "https://s3.wasabisys.com"
  }
}

provider "aws" {
  alias  = "sydney"
  region = "ap-southeast-2"

  s3_use_path_style           = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    sts = "https://sts.ap-southeast-2.wasabisys.com"
    iam = "https://iam.ap-southeast-2.wasabisys.com"
    s3  = "https://s3.ap-southeast-2.wasabisys.com"
  }
}
