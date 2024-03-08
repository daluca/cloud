# Redis cluster

## Delete all keys

<!-- markdownlint-disable MD013 -->
```shell
redis-cli -c -a "${REDIS_PASSWORD}" --scan | xargs -i echo DEL {} | redis-cli -c -a "${REDIS_PASSWORD}"
```
<!-- markdownlint-enable MD013 -->
