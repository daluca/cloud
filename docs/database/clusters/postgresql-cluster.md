# PostgreSQL Cluster

## Upgrades

Before upgrading the PostgreSQL Cluster you need to delete the last SGDbOps upgrade as the Stackgres operator dry-runs the manifest beforehand causing a [forbidden configuration update error](https://stackgres.io/doc/1.8/api/responses/error/#forbidden-configuration-update). This error is not the same as an immutable field in Kubernetes and therefore cannot be forced with [FluxCD kustomization annotations](https://fluxcd.io/flux/components/kustomize/kustomizations/#force).

```shell
kubectl --namespace database delete sgdbops postgresql-cluster-minor-upgrade
```

Once the upgrade is complete, restart the cluster

### Security Upgrades

A security upgrade is should be applied before a minor or major upgrade to avoid a version mismatch error as seen below in these issues.

<https://gitlab.com/ongresinc/stackgres/-/issues/2055>

<https://gitlab.com/ongresinc/stackgres/-/issues/1985>

### SSA Annotation

The StackGres Operator updates the underlying SGCluster resource when upgrades happen, this causes a conflict with FluxCD as it tries to sync changes as well. In order to have FluxCD ignore the manifest once it is initially applied, the following annotation is used.

```yaml
  annotations:
    kustomize.toolkit.fluxcd.io/ssa: IfNotPresent
```
