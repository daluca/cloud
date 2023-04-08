# CrowdSec

## Configuration

### Overriding values

It is possible with Crowdsec to [override values](https://docs.crowdsec.net/docs/configuration/crowdsec_configuration/#overriding-values)
with a `config.yaml.local`. Values in this file take precedence over `config.yaml`.

### Environment variables

Crowdsec configuration files can make use of [environment variables](https://docs.crowdsec.net/docs/configuration/crowdsec_configuration/#environment-variables)
so sensitive data doesn't have to be stored in visible configuration such as a ConfigMap.

## Bouncers

### Ingress NGINX

Create an API key using a pre-defined key

```shell
cscli bouncers add -k <key>
```
