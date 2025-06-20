# data "terraform_remote_state" "vpc" {
#   backend = "local"

#   config = {
#     path = "../vpc/terraform.tfstate"
#   }
# }

data "terraform_remote_state" "vpc" { ### if using s3 bucket as backend
  backend = "s3"

  config = {
    bucket         = "homelab-tfstatefile-2025-1"
    key            = "dev/vpc.tfstate"
    region         = "us-east-1"
  }
}