variable "region" {
  description = "Location of resources."
  type        = string
}

variable "environment" {
  description = "Logical stage of deployment."
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

variable "kubernetes_node_count" {
  description = "Number of kubernetes worker nodes."
  type        = number
}

variable "github_repository" {
  description = "GitHub repository for Flux to sync with."
  type        = string
}

variable "flux_version" {
  description = "Flux manifest version."
  type        = string
}
