variable "container" {
  description = "Globally unique name for Catalyst cloud container."
  type        = string

  validation {
    condition     = can(regex("^[^/_]*$", var.container))
    error_message = "Name must not contain '/' or '_'"
  }
}

variable "versioning" {
  description = "Enable container versioning."
  type        = bool
  default     = false
}

variable "public_access" {
  description = "Enable public access."
  type        = bool
  default     = false
}

variable "multi_region_replicas" {
  description = "Enable multi-region storage policy."
  type        = bool
  default     = false
}

variable "region" {
  description = "Catalyst cloud region"
  type        = string

  validation {
    condition     = contains(["nz-hlz-1", "nz-por-1", "nz_wlg_2"], var.region)
    error_message = "Region must be one of ['nz-hlz-1', 'nz-por-1', 'nz_wlg_2']"
  }
}

variable "read_users" {
  description = "List of read user ids."
  type        = list(string)
  default     = []
}

variable "write_users" {
  description = "List of write user ids."
  type        = list(string)
  default     = []
}

variable "project_id" {
  description = "Project ID to restrict user ACLs."
  type        = string
  default     = "*"
}
