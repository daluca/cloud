environment = "staging"
region      = "syd1"

kubernetes_version = "1.25"
kubernetes_nodes = {
  name   = "default"
  count  = 2
  cpus   = [2, 4]
  memory = [4096, 8192]
}
