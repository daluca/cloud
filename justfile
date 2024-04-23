mod docs

[private]
default:
  @just --list

get-staging-config:
  doctl kubernetes cluster kubeconfig save "$( doctl kubernetes cluster list -o json | jq -r '.[] | select(.name == "staging-cluster") | .id' )"

delete-staging-config:
  yq --inplace 'del(.clusters[] | select(.name == "do-syd1-staging-cluster")) | del(.users[] | select(.name == "do-syd1-staging-cluster-admin")) | del(.contexts[] | select(.name == "do-syd1-staging-cluster")) | .current-context = .contexts[-1].name' ~/.kube/config

clean:
  find \( -type d -name ".terraform" -o -type f -name ".terraform.lock.hcl" \) -print -exec rm -r {} +
