resource "kubernetes_secret" "sops" {
  depends_on = [module.fluxcd]

  metadata {
    name      = "sops-age"
    namespace = "flux-system"
  }

  data = {
    "cluster.agekey" = var.flux.age_key
  }
}

resource "kubernetes_secret" "cluster_substitutions" {
  depends_on = [module.fluxcd]

  metadata {
    name      = "${local.environment}-terraform-substitutions"
    namespace = "flux-system"
  }

  data = {
    STACKGRES_BACKUP_BUCKET = module.stackgres_backup.bucket
    VELERO_BACKUP_BUCKET    = module.velero_backup.bucket
  }
}

resource "kubernetes_secret" "cert_manager_cloudflare_api_token" {
  depends_on = [module.fluxcd]

  metadata {
    name      = "cloudflare-api-token"
    namespace = "cert-manager"
  }

  data = {
    token = cloudflare_api_token.cert_manager.value
  }
}

resource "kubernetes_secret" "extrenal_dns_cloudflare_api_token" {
  depends_on = [module.fluxcd]

  metadata {
    name      = "cloudflare-credentials"
    namespace = "kube-system"
  }

  data = {
    token = cloudflare_api_token.external_dns.value
  }
}

resource "kubernetes_secret" "velero_wasabi_credentials" {
  depends_on = [module.fluxcd]

  metadata {
    name      = "velero-wasabi-credentials"
    namespace = "backups"
  }

  data = {
    AWS_ACCESS_KEY_ID     = sensitive(aws_iam_access_key.velero.id)
    AWS_SECRET_ACCESS_KEY = aws_iam_access_key.velero.secret
  }
}

resource "kubernetes_secret" "stackgres_wasabi_credentials" {
  depends_on = [module.fluxcd]

  metadata {
    name      = "wasabi-bucket-credentials"
    namespace = "database"
  }

  data = {
    access-key = sensitive(aws_iam_access_key.stackgres.id)
    secret-key = aws_iam_access_key.stackgres.secret
  }
}

resource "kubernetes_secret" "nextcloud_wasabi_credentials" {
  depends_on = [module.fluxcd]

  metadata {
    name      = "wasabi-credentials"
    namespace = "nextcloud"
  }

  data = {
    bucket     = module.nextcloud_storage.bucket
    access-key = sensitive(aws_iam_access_key.nextcloud.id)
    secret-key = aws_iam_access_key.nextcloud.secret
  }
}
