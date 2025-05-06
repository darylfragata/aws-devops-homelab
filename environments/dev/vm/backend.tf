terraform {
  backend "s3" {
    bucket         = "dev-tfstatefile-031825"
    key            = "dev/ec2.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev_terraform_state_lock"
  }
}
