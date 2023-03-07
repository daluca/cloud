locals {
  storage_policy = var.multi_region_replicas ? "nz--o1--mr-r3" : "${replace(var.region, "_", "-")}--o1--sr-r3"
  read_access    = length(var.read_users) > 0 ? join(",", [for user in var.read_users : format("%s:%s", var.project_id, user)]) : var.public_access ? ".r:*,.rlistings" : ""
  write_access   = length(var.write_users) > 0 ? join(",", [for user in var.write_users : format("%s:%s", var.project_id, user)]) : ""
}

resource "openstack_objectstorage_container_v1" "container" {
  name   = var.container
  region = var.region

  storage_policy  = local.storage_policy
  container_read  = local.read_access
  container_write = local.write_access

  dynamic "versioning_legacy" {
    for_each = var.versioning ? ["legacy"] : []
    content {
      type     = "versions"
      location = openstack_objectstorage_container_v1.archive.0.name
    }
  }
}

resource "openstack_objectstorage_container_v1" "archive" {
  count = var.versioning ? 1 : 0

  name           = "archive-${var.container}"
  storage_policy = local.storage_policy
}
