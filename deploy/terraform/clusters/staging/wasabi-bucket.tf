resource "random_id" "stackgres_backup_suffix" {
  byte_length = 8
}

module "stackgres_backup" {
  source = "../../modules/wasabi-bucket"

  bucket            = sensitive("stackgres-staging-${random_id.stackgres_backup_suffix.hex}")
  restrict_to_users = [sensitive(aws_iam_user.stackgres.arn)]
}

resource "random_id" "velero_backup_suffix" {
  byte_length = 8
}

module "velero_backup" {
  source = "../../modules/wasabi-bucket"

  bucket            = sensitive("velero-staging-${random_id.velero_backup_suffix.hex}")
  restrict_to_users = [sensitive(aws_iam_user.velero.arn)]
}

resource "random_id" "nextcloud_bucket_suffix" {
  byte_length = 8
}

module "nextcloud_bucket" {
  source = "../../modules/wasabi-bucket"
  providers = {
    wasabi = wasabi.sydney
  }

  bucket            = sensitive("nextcloud-staging-${random_id.nextcloud_bucket_suffix.hex}")
  restrict_to_users = [sensitive(aws_iam_user.nextcloud.arn)]
  versioning        = true
}
