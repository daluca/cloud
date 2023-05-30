locals {
  bucket_suffix = var.wasabi.bucket_suffix != "" || var.wasabi.bucket_suffix != null ? "-${var.wasabi.bucket_suffix}" : ""
}

module "stackgres_backup" {
  source = "../wasabi-bucket"

  providers = {
    wasabi = wasabi.backup
  }

  bucket            = sensitive("stackgres-${local.environment}${local.bucket_suffix}")
  restrict_to_users = [sensitive(aws_iam_user.stackgres.arn)]
}
module "velero_backup" {
  source = "../wasabi-bucket"

  providers = {
    wasabi = wasabi.backup
  }

  bucket            = sensitive("velero-${local.environment}${local.bucket_suffix}")
  restrict_to_users = [sensitive(aws_iam_user.velero.arn)]
}

module "nextcloud_storage" {
  source = "../wasabi-bucket"

  providers = {
    wasabi = wasabi.storage
  }

  bucket            = sensitive("nextcloud-${local.environment}${local.bucket_suffix}")
  restrict_to_users = [sensitive(aws_iam_user.nextcloud.arn)]
  versioning        = true
}
