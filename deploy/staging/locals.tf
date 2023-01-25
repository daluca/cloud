locals {
  environments = {
    production  = "prd"
    staging     = "stg"
    development = "dev"
  }

  enabled = var.disable_cost ? 0 : 1
}
