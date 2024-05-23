# Cloudflare

## Rotating API tokens

This can be achieved by removing the time offset from the terraform state, in effect resetting it.

```bash
terraform state rm 'time_offset.one_year_from_now'
```
