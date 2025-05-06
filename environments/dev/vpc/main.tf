module "vpc_main" {
  source      = "../../../modules/vpc"
  vpc_cidr    = "10.198.28.0/23"
  environment = "dev"
  create_nat  = false
  create_eip  = false

  public_subnets = {
    public_management = {
      cidr_block        = "10.198.29.128/27"
      availability_zone = "us-east-1a"
    }
  }

  private_subnets = {
    private-app-1 = {
      cidr_block        = "10.198.28.0/25"
      availability_zone = "us-east-1a"
    }
    private-db-1 = {
      cidr_block        = "10.198.29.0/25"
      availability_zone = "us-east-1b"
    }
  }
}
