# Ingress NGINX

## Proxy real IP

Include the local 10 range CIDR to include proxying from the DigitalOcean load balancer as well as
CloudFlares proxies.

```yaml
proxy-real-ip-cidr: 10.0.0.0/8,${CLOUDFLARE_IPV4_RANGE}
```
