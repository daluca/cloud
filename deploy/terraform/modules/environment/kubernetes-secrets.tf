resource "kubernetes_secret" "sops" {
  depends_on = [module.fluxcd]

  metadata {
    name      = "sops-age"
    namespace = "flux-system"
  }

  data = {
    "cluster.agekey" = file("${pathexpand("~/.sops/age/")}/do-${data.digitalocean_region.main.slug}-${local.environment}-cluster.agekey")
  }
}
