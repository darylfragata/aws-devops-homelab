variable "security_group_name" {
  description = "Name of the Security Group"
  type        = string
}

variable "security_group_description" {
  description = "Description of the Security Group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the Security Group will be created"
  type        = string



}

variable "tags" {
  description = "Tags for the Security Group"
  type        = map(string)
  default     = {}
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string  # ✅ Added description field
  }))
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string  # ✅ Added description field
  }))
}
