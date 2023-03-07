resource "random_id" "nextcloud_container_suffix" {
  byte_length = 8
}

module "nextcloud" {
  source = "../../modules/catalyst-cloud-object-storage"

  container = "nextcloud-${random_id.nextcloud_container_suffix.hex}"
  region    = var.catalyst_cloud_region

  read_users  = [var.catalyst_cloud_nextcloud_user_id]
  write_users = [var.catalyst_cloud_nextcloud_user_id]
  project_id  = data.openstack_identity_project_v3.main.id
}
