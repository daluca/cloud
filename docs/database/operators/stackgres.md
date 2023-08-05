# StackGres

## Staging

The create-certificate hooks are post install which is in conflict with the deployment itself.

The current work around is to scale down both the `stackgres-operator` and `stackgres-rest-api` down
to 0 to allow the post-install hooks to kick in.
