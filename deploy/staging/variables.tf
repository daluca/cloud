variable "environment" {
  description = "Logical stage of deployment."
  type        = string
}

variable "region" {
  description = "Location of resources."
  type        = string
}

variable "domain" {
  description = "Domain to host applications."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes cluster major and minor version."
  type        = string
}

variable "kubernetes_nodes" {
  description = "Kubernetes node pool specification. Note: Memory in MiB"
  type = object({
    name   = string
    count  = number
    cpus   = list(number)
    memory = list(number)
  })
}
