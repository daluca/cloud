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
