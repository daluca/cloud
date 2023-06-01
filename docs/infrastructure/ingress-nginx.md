# Ingress NGINX

## Proxy real IP

Include the VPC CIDR range to resolve proxying from the DigitalOcean load balancer as well as
CloudFlares proxies.

```yaml
proxy-real-ip-cidr: ${STAGING_VPC_CIDR},${CLOUDFLARE_IPV4_RANGE}
```

## DigitalOcean Load Balancers

### Annotations

The full annotation docs are located on [DigitalOcean's repo](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/docs/controllers/services/annotations.md)

#### Proxy protocol work around

The `do-loadbalancer-hostname` annotation is required as a work around to get the proxy-protocol
 to work.
