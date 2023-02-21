locals {
  versioning = var.versioning ? "Enabled" : "Disabled"
}

resource "aws_s3_bucket_acl" "private" {
  bucket = wasabi_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = wasabi_bucket.bucket.id

  versioning_configuration {
    status = local.versioning
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = wasabi_bucket.bucket.id

  policy = jsonencode(
    {
      Id      = "RestrictUsers"
      Version = "2012-10-17"
      Statement = [
        {
          Sid    = "AllAccess"
          Action = "s3:*"
          Effect = "Allow"
          Resource = [
            wasabi_bucket.bucket.arn,
            "${wasabi_bucket.bucket.arn}/*"
          ]
          Principal : {
            AWS : var.restrict_to_users
          }
        }
      ]
    }
  )
}
