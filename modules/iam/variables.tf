variable "role_name" {
  description = "IAM Role Name"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM Instance Profile Name"
  type        = string
}

variable "assume_role_policy" {
  description = "IAM Assume Role Policy JSON"
  type        = string
}

variable "policy_arns" {
  description = "List of policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}

variable "custom_policy_name" {
  description = "Custom inline policy name"
  type        = string
  default     = null
}

variable "custom_policy_json" {
  description = "Custom IAM policy JSON"
  type        = string
  default     = null
}
