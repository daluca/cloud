# TF-controller

## Work around

In order to have `tf-controller` be able to read the object from secrets, a workaround of using `readInputsFromSecrets` in combination with `values` became the only solution I could find.

```yaml
  readInputsFromSecrets:
    - name: users-terraform-values
      as: values
  values:
    users: ${{ .values.users }}
```

This leads to reworking the terraform variable to use values as a wrapper almost

```hcl
variable "values" {
  description = "Keycloak user settings."
  type = object({
    users = map(object({
      ...
    }))
  })
}
```
