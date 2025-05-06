module "application_sg" {
  source                     = "../../../modules/security_groups"
  security_group_name        = "app_01_server_sg"
  security_group_description = "Security group for Application Server"
  vpc_id                     = data.terraform_remote_state.vpc.outputs.vpc_main_id # Ensure you have a module.network outputting vpc_id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH access from anywhere" # ✅ Added description
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP traffic"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTPS traffic"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]

  tags = {
    Environment = "dev"
    Name        = "application_sg"
  }
}

output "application_sg_id" {
  value = module.application_sg.sg_id
}