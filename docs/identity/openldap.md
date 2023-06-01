# OpenLDAP

## Service

Use `sessionAffinity` to keep the same connection from Keycloak to OpenLDAP so when Keycloak refreshes
after adding entries it queries the same OpenLDAP instances and not one that hasn't had the changes
synced over yet.

```yaml
spec:
  sessionAffinity: ClientIP
  sessionAffinityConfig:
    clientIP:
      timeoutSeconds: 10
```

## Commands

### Search organisation

```shell
ldapsearch -LLLWx -H ldap://localhost:1389 -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" "+"
```

### Search cn=config

```shell
ldapsearch -LLLWx -H ldap://localhost:1389 -b cn=config -D "cn=admin,cn=config" "+"
```
