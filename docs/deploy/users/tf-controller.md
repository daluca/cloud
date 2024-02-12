# Terraform controller

## Work around

Adding a complex object variable as a secret ended up being tricky to work with using varsFrom.

Using `fileMappings` to mount a `auto.tfvars` file from a `Secret` ended up being the only viable
solution I found.

```yaml
  fileMappings:
    - location: workspace
      path: users.auto.tfvars
      secretKey:
        name: users-terraform-values
        key: users.tfvars
```
