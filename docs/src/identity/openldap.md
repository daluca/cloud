# OpenLDAP

## Commands

### Search organisation

```shell
ldapsearch -LLLWx -H ldap://localhost:1389 -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" "+"
```

### Search cn=config

```shell
ldapsearch -LLLWx -H ldap://localhost:1389 -b cn=config -D "cn=admin,cn=config" "+"
```
