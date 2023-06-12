resource "random_id" "stackgres_backup_suffix" {
  byte_length = 8
}

module "stackgres_backup" {
  source = "../wasabi-bucket"

  providers = {
    wasabi = wasabi.backup
  }

  bucket            = sensitive("stackgres-${local.environment}-${random_id.stackgres_backup_suffix.hex}")
  restrict_to_users = [sensitive(aws_iam_user.stackgres.arn)]
}

resource "random_id" "velero_backup_suffix" {
  byte_length = 8
}

module "velero_backup" {
  source = "../wasabi-bucket"

  providers = {
    wasabi = wasabi.backup
  }

  bucket            = sensitive("velero-${local.environment}-${random_id.velero_backup_suffix.hex}")
  restrict_to_users = [sensitive(aws_iam_user.velero.arn)]
}

resource "random_id" "nextcloud_bucket_suffix" {
  byte_length = 8
}

module "nextcloud_storage" {
  source = "../wasabi-bucket"

  providers = {
    wasabi = wasabi.storage
  }

  bucket            = sensitive("nextcloud-${local.environment}-${random_id.nextcloud_bucket_suffix.hex}")
  restrict_to_users = [sensitive(aws_iam_user.nextcloud.arn)]
  versioning        = true
}
