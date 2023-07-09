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
