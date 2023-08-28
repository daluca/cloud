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
