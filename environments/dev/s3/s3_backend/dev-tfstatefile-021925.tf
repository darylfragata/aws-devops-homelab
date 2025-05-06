provider "aws" {
  region  = var.dev_region
  profile = "default"
}

variable "dev_region" {
  description = "Provider region"
  default     = "us-east-1"
}

module "tfstatefile_bucket" {
  source      = "../../../../modules/s3"
  bucket_name = "dev-tfstatefile-021925"

  tags = {
    Name = "terraform_state_bucket"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name     = "dev_terraform_state_lock"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
  tags = {
    Name = "dev_remote_state_db"
  }
}