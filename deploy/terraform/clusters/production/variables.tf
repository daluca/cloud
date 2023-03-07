variable "environment" {
  description = "Logical stage of deployment."
  type        = string
}

variable "catalyst_cloud_region" {
  description = "Catalyst Cloud region."
  type        = string

  validation {
    condition     = contains(["nz-hlz-1", "nz-por-1", "nz_wlg_2"], var.catalyst_cloud_region)
    error_message = "Region must be one of ['nz-hlz-1', 'nz-por-1', 'nz_wlg_2']"
  }
}
