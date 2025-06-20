variable "dev_region" {
  description = "Provider region"
  default     = "us-east-1"
}

variable "ubuntu_ami" {
  description = "AMI ID for the instance"
  type        = string
}

variable "rhel_ami" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type_app" {
  description = "Instance type"
  type        = string
}

variable "instance_type_db" {
  description = "Instance type"
  type        = string
}


variable "instance_type_ansible" {
  description = "Instance type for Ansible server"
  type        = string
}

variable "public_key" {
  description = "SSH Public Key Content"
  type        = string
}

variable "key_pair_name" {
  description = "The name of the SSH key pair"
  type        = string
}