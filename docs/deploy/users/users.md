# Users

## Create new users

Create a user hash

```bash
echo -n '<username>' | sha256sum | grep -Eo '^.{10}'
```
