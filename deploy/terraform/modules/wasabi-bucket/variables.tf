variable "bucket" {
  description = "Globally unique bucket name for wabasi bucket."
  type        = string

  validation {
    condition     = can(regex("[A-Za-z0-9]{3,63}", var.bucket))
    error_message = "Bucket name must be between 3 and 63 characters long and only use alphanumeric characters."
  }
}

variable "versioning" {
  description = "Enable bucket versioning."
  type        = bool
  default     = false
}

variable "restrict_to_users" {
  description = "Restrict the bucket to a set of users."
  type        = list(string)

  validation {
    condition     = can([for user in var.restrict_to_users : regex("^arn:aws:iam::[0-9]{12}:user/[A-Za-z0-9-_]+$", user)])
    error_message = "String in list must be a valid user arn."
  }
}
