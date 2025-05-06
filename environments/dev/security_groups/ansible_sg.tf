module "ansible_sg" {
  source                     = "../../../modules/security_groups"
  security_group_name        = "ansible-server-sg"
  security_group_description = "Security group for Ansible Server"
  vpc_id                     = data.terraform_remote_state.vpc.outputs.vpc_main_id

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
    Name        = "ansible_sg"
  }
}


output "ansible_sg_id" {
  value = module.ansible_sg.sg_id
}