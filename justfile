mod docs

[private]
default:
  @just --list

get-staging-config:
  doctl kubernetes cluster kubeconfig save "$( doctl kubernetes cluster list -o json | jq -r '.[] | select(.name == "staging-cluster") | .id' )"

clean:
  find \( -type d -name ".terraform" -o -type f -name ".terraform.lock.hcl" \) -print -exec rm -r {} +
