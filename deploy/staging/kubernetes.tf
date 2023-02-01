resource "kubernetes_namespace" "flux_system" {
  metadata {
    name = "flux-system"
  }

  lifecycle {
    ignore_changes = [
      metadata[0].labels
    ]
  }
}

data "kubectl_file_documents" "flux_install" {
  content = data.flux_install.staging.content
}

data "kubectl_file_documents" "flux_sync" {
  content = data.flux_sync.staging.content
}

locals {
  flux_install = [for v in data.kubectl_file_documents.flux_install.documents : {
    data : yamldecode(v)
    content : v
  }]

  flux_sync = [for v in data.kubectl_file_documents.flux_sync.documents : {
    data : yamldecode(v)
    content : v
  }]
}

resource "kubectl_manifest" "flux_install" {
  for_each   = { for v in local.flux_install : lower(join("/", compact([v.data.apiVersion, v.data.kind, lookup(v.data.metadata, "namespace", ""), v.data.metadata.name]))) => v.content }
  depends_on = [kubernetes_namespace.flux_system]
  yaml_body  = each.value

  lifecycle {
    ignore_changes = [
      yaml_body
    ]
  }
}

resource "kubectl_manifest" "flux_sync" {
  for_each   = { for v in local.flux_sync : lower(join("/", compact([v.data.apiVersion, v.data.kind, lookup(v.data.metadata, "namespace", ""), v.data.metadata.name]))) => v.content }
  depends_on = [kubernetes_namespace.flux_system]
  yaml_body  = each.value

  lifecycle {
    ignore_changes = [
      yaml_body
    ]
  }
}

resource "kubernetes_secret" "flux" {
  depends_on = [kubectl_manifest.flux_install]

  metadata {
    name      = data.flux_sync.staging.secret
    namespace = kubernetes_namespace.flux_system.id
  }

  data = {
    "identity"     = tls_private_key.flux.private_key_pem
    "identity.pub" = tls_private_key.flux.public_key_pem
    "known_hosts"  = local.github_known_hosts
  }
}
