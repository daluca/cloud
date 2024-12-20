resource "kubernetes_secret" "nextcloud_openid_connect" {
  metadata {
    name      = "nextcloud-openid-connect"
    namespace = "nextcloud"
  }

  data = {
    "client-id"     = keycloak_openid_client.nextcloud.client_id
    "client-secret" = keycloak_openid_client.nextcloud.client_secret
  }
}

resource "kubernetes_secret" "miniflux_openid_connect" {
  metadata {
    name      = "miniflux-openid-connect"
    namespace = "rss"
  }

  data = {
    "OAUTH2_CLIENT_ID"     = keycloak_openid_client.miniflux.client_id
    "OAUTH2_CLIENT_SECRET" = keycloak_openid_client.miniflux.client_secret
  }
}

resource "kubernetes_secret" "oauth2_proxy_openid_connect" {
  metadata {
    name      = "oauth2-proxy-openid-connect"
    namespace = "identity"
  }

  data = {
    "client-id"     = keycloak_openid_client.oauth2_proxy.client_id
    "client-secret" = keycloak_openid_client.oauth2_proxy.client_secret
  }
}

resource "kubernetes_secret" "synapse_openid_connect" {
  metadata {
    name      = "synapse-openid-connect"
    namespace = "matrix"
  }

  data = {
    "keycloak.yaml" = <<-EOF
      oidc_providers:
        - client_id: ${keycloak_openid_client.synapse.client_id}
          client_secret: ${keycloak_openid_client.synapse.client_secret}
    EOF
  }
}

resource "kubernetes_secret" "headscale_openid_connect" {
  metadata {
    name      = "headscale-openid-connect"
    namespace = "vpn"
  }

  data = {
    "client-id"     = keycloak_openid_client.headscale.client_id
    "client-secret" = keycloak_openid_client.headscale.client_secret
  }
}

resource "kubernetes_secret" "mealie_openid_connect" {
  metadata {
    name      = "mealie-openid-connect"
    namespace = "mealie"
  }

  data = {
    "OIDC_CLIENT_ID"     = keycloak_openid_client.mealie.client_id
    "OIDC_CLIENT_SECRET" = keycloak_openid_client.mealie.client_secret
  }
}

resource "kubernetes_secret" "linkwarden_openid_connect" {
  metadata {
    name      = "linkwarden-openid-connect"
    namespace = "linkwarden"
  }

  data = {
    "KEYCLOAK_CLIENT_ID"     = keycloak_openid_client.linkwarden.client_id
    "KEYCLOAK_CLIENT_SECRET" = keycloak_openid_client.linkwarden.client_secret
  }
}
