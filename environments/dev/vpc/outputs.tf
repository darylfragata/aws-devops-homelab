output "public_subnet_ids" {
  value = module.vpc_main.public_subnet_ids

}

output "private_subnet_ids" {
  value = module.vpc_main.private_subnet_ids

}

output "vpc_main_id" {
  value = module.vpc_main.vpc_id

}

output "elastic_ip" {
  value = module.vpc_main.eip_id
}

output "nat_gw_id" {
  value = module.vpc_main.nat_gateway_id
}