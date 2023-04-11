# Ingress NGINX

## Proxy real IP

Include the VPC CIDR range to resolve proxying from the DigitalOcean load balancer as well as
CloudFlares proxies.

```yaml
proxy-real-ip-cidr: ${STAGING_VPC_CIDR},${CLOUDFLARE_IPV4_RANGE}
```
