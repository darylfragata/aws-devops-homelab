output "instance_id" {
  description = "ID of the instance"
  value       = aws_instance.compute.id
}

output "public_ip" {
  description = "Public IP of the instance (if assigned)"
  value       = aws_instance.compute.public_ip
}

output "private_ip" {
  description = "Private IP of the instance"
  value       = aws_instance.compute.private_ip
}
