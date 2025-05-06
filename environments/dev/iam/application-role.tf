module "application-role" {
  source = "../../../modules/iam" # Reference the IAM module

  role_name             = "application-role"
  instance_profile_name = "application-instance-profile"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  policy_arns = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
  "arn:aws:iam::aws:policy/AmazonSSMFullAccess"]

  # Optional: Custom inline policy
  #   custom_policy_name = "ec2-custom-policy"
  #   custom_policy_json = jsonencode({
  #     Version = "2012-10-17"
  #     Statement = [{
  #       Effect   = "Allow"
  #       Action   = ["ec2:DescribeInstances"]
  #       Resource = "*"
  #     }]
  #   })
}

output "application_role_name" {
  value = module.application-role.instance_profile_name
}
