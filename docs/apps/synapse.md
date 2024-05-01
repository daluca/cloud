# Synapse

## Cloudflare proxy

Certain port support Cloudflare's proxy, the default port used for federation is not one of them.
This breaks federation so changing the port to one of the supports ports solves this problem.
<https://developers.cloudflare.com/fundamentals/reference/network-ports/>
