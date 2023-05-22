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
