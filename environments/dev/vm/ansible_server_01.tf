module "ansible_server_01" {
  source               = "../../../modules/ec2"
  ami                  = var.byol_ami
  instance_type        = var.instance_type
  subnet_id            = data.terraform_remote_state.vpc.outputs.public_subnet_ids["public_management"] ### if using s3 bucket as backend
  security_group_ids   = [data.terraform_remote_state.security_groups.outputs.ansible_sg_id]
  iam_instance_profile = data.terraform_remote_state.iam.outputs.ansible_role_name

  my_key        = aws_key_pair.existing_key.key_name  # Define your key name
  

  tags = {
    Environment = "dev"
    Name        = "ansible_server_1"
  }

  depends_on = [aws_key_pair.existing_key]  # Explicit dependency
}
