resource "random_id" "terraform_state_suffix" {
  byte_length = 8
}

module "terraform_state" {
  source = "../../modules/catalyst-cloud-object-storage"

  container = "terraform-state-${random_id.terraform_state_suffix.hex}"
  region    = var.catalyst_cloud_region

  versioning            = true
  multi_region_replicas = true
}
