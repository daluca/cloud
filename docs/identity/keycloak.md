# Keycloak

## CloudFlare

SSL encryption mode set to full otherwise weird http redirects

## Ingress

Set backend HTTPS so that connections will work with tls cert

```yaml
metadata:
  annotations:
    nginx.ingress.kubernetes.io/backend-protocol: https
```

## User Federation

A good guide to get started on [OpenLDAP user federation](https://www.talkingquickly.co.uk/keycloak-and-openldap-on-kubernetes)

## iframe checks

I frame checks that your origin is the same as iframe otherwise will fail and the admin panel will
not be accessible

Found an explanation [here](https://www.hoab.fr/tag/keycloak)

## Host related issue

This [GitHub issue](https://github.com/keycloak/keycloak/issues/14666) talks about various issues such as step.html 404 issue

## Clients

Staging environment blocks external traffic, OIDC means the node which is running the client tries
to make the connection and fails.

## TF_VAR_users

Username sha265 command

```shell
echo -n '<username>' | sha256sum | grep -Eo '^.{10}'
```

## Manual changes

Update the account-console clients web origins to "+"
