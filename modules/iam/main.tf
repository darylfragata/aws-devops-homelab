resource "aws_iam_role" "ec2_role" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_policy_attachment" "policy_attachment" {
  for_each   = toset(var.policy_arns)
  name       = "${var.role_name}-policy-attachment"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = each.value

  depends_on = [ aws_iam_role.ec2_role ]
}

resource "aws_iam_policy" "custom_policy" {
  count       = var.custom_policy_name != null ? 1 : 0
  name        = var.custom_policy_name
  policy      = var.custom_policy_json
}

resource "aws_iam_role_policy_attachment" "custom_policy_attach" {
  count      = var.custom_policy_name != null ? 1 : 0
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.custom_policy[0].arn
}
