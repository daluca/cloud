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
