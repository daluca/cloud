# Catalyst Cloud

## Openstack

Object storage uses the legacy versioning

This places old versions into a separate [container](../../GLOSSARY.md#catalyst-cloud)

When the current version of a file is deleted it work restore the most recent version from the old
container

### Access Keys

As best I can tell, these cannot be provisioned with terraform

openstack cli does the trick

```shell
openstack ec2 credentials create
```
