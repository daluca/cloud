resource "aws_iam_user" "stackgres" {
  name = "stackgres"
}

resource "aws_iam_access_key" "stackgres" {
  user = aws_iam_user.stackgres.id
}

resource "aws_iam_user" "velero" {
  name = "velero"
}

resource "aws_iam_access_key" "velero" {
  user = aws_iam_user.velero.id
}

resource "aws_iam_user" "nextcloud" {
  name = "nextcloud"
}

resource "aws_iam_access_key" "nextcloud" {
  user = aws_iam_user.nextcloud.id
}
