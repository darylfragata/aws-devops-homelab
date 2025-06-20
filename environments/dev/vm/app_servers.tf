module "app_server_01" {
  source               = "../../../modules/ec2"
  ami                  = var.rhel_ami
  instance_type        = var.instance_type_app
  #subnet_id            = data.terraform_remote_state.vpc.outputs.private_subnet_ids["private-app-1"] 
  subnet_id            = data.terraform_remote_state.vpc.outputs.public_subnet_ids["public_management"] #to have public ip address
  security_group_ids   = [data.terraform_remote_state.security_groups.outputs.application_sg_id]
  iam_instance_profile = data.terraform_remote_state.iam.outputs.application_role_name

  my_key        = aws_key_pair.existing_key.key_name  # Define your key name

  tags = {
    Environment = "dev"
    Name        = "APP-01"
  }
}

module "app_server_02" {
  source               = "../../../modules/ec2"
  ami                  = var.rhel_ami
  instance_type        = var.instance_type_app
  #subnet_id            = data.terraform_remote_state.vpc.outputs.private_subnet_ids["private-app-1"]
  subnet_id            = data.terraform_remote_state.vpc.outputs.public_subnet_ids["public_management"] #to have public ip address
  security_group_ids   = [data.terraform_remote_state.security_groups.outputs.application_sg_id]
  iam_instance_profile = data.terraform_remote_state.iam.outputs.application_role_name

  my_key        = aws_key_pair.existing_key.key_name  # Define your key name

  tags = {
    Environment = "dev"
    Name        = "APP-02"
  }
}

module "app_server_03" {
  source               = "../../../modules/ec2"
  ami                  = var.rhel_ami
  instance_type        = var.instance_type_app
  #subnet_id            = data.terraform_remote_state.vpc.outputs.private_subnet_ids["private-app-1"] 
  subnet_id            = data.terraform_remote_state.vpc.outputs.public_subnet_ids["public_management"] #to have public ip address
  security_group_ids   = [data.terraform_remote_state.security_groups.outputs.application_sg_id]
  iam_instance_profile = data.terraform_remote_state.iam.outputs.application_role_name

  my_key        = aws_key_pair.existing_key.key_name  # Define your key name

  tags = {
    Environment = "dev"
    Name        = "ASCS"
  }
}

module "app_server_04" {
  source               = "../../../modules/ec2"
  ami                  = var.rhel_ami
  instance_type        = var.instance_type_app
  #subnet_id            = data.terraform_remote_state.vpc.outputs.private_subnet_ids["private-app-1"]
  subnet_id            = data.terraform_remote_state.vpc.outputs.public_subnet_ids["public_management"] #to have public ip address
  security_group_ids   = [data.terraform_remote_state.security_groups.outputs.application_sg_id]
  iam_instance_profile = data.terraform_remote_state.iam.outputs.application_role_name

  my_key        = aws_key_pair.existing_key.key_name  # Define your key name

  tags = {
    Environment = "dev"
    Name        = "ERS"
  }
}