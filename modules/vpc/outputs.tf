output "public_subnet_ids" {
  value = { for k, v in aws_subnet.public_subnets : k => v.id }
}

output "private_subnet_ids" {
  value = { for k, v in aws_subnet.private_subnets : k => v.id }
}

output "vpc_id" {
  value = aws_vpc.vpc_template.id
}

output "nat_gateway_id" {
  value = var.create_nat ? aws_nat_gateway.nat_gw[0].id : null  
}

output "eip_id"{
  value = aws_eip.eip[*].id
}