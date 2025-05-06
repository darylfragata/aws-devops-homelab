output "sg_id" {
  description = "ID of the Security Group"
  value       = aws_security_group.this.id
}

output "sg_arn" {
  description = "ARN of the Security Group"
  value       = aws_security_group.this.arn
}
