resource "wasabi_bucket" "bucket" {
  bucket = var.bucket

  versioning {
    enabled = var.versioning
  }
}

resource "wasabi_bucket_policy" "bucket_policy" {
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
