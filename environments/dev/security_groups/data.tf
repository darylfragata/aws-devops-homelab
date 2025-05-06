# data "terraform_remote_state" "vpc" {
#   backend = "local"

#   config = {
#     path = "../vpc/terraform.tfstate"
#   }
# }

data "terraform_remote_state" "vpc" { ### if using s3 bucket as backend
  backend = "s3"

  config = {
    bucket         = "dev-tfstatefile-031825"
    key            = "dev/vpc.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev_terraform_state_lock"
  }
}