variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet CIDRs with their availability zones"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "private_subnets" {
  description = "Private subnet CIDRs with their availability zones"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "create_nat" {
  type    = bool
  default = false
}

variable "create_eip" {
  type    = bool
  default = false
}