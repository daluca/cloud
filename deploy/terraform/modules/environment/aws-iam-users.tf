resource "aws_iam_user" "stackgres" {
  name = "stackgres-${local.environment}"
}

resource "aws_iam_access_key" "stackgres" {
  user = aws_iam_user.stackgres.id
}

resource "aws_iam_user" "velero" {
  name = "velero-${local.environment}"
}

resource "aws_iam_access_key" "velero" {
  user = aws_iam_user.velero.id
}

resource "aws_iam_user" "nextcloud" {
  name = "nextcloud-${local.environment}"
}

resource "aws_iam_access_key" "nextcloud" {
  user = aws_iam_user.nextcloud.id
}
