# DigitalOcean

## API keys

API keys must be provisioned on the web console.

## Spaces keys

[Spaces](../../GLOSSARY.md#digitalocean) keys must be provisioned on the web console.

## Kubernetes

### Cluster Autoscaling

[DigitalOcean's kubernetes cluster autoscaler FAQ](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md)

Check the current status of cluster autoscaling

```shell
kubectl get configmap cluster-autoscaler-status -o yaml -n kube-system
```
