resource "aws_key_pair" "existing_key" {
  key_name   = var.key_pair_name  # The variable key name from the environment or CI/CD
  public_key = var.public_key    # This will be passed in from the environment/CI/CD
}
