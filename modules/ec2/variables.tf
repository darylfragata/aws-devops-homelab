variable "ami" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be deployed"
  type        = string
}

variable "security_group_ids" {
  description = "List of security groups"
  type        = list(string)
}

variable "my_key" {
  description = "The name of the key pair to use for the EC2 instance"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM role to attach"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for the instance"
  type        = map(string)
}

