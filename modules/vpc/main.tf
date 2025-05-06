resource "aws_vpc" "vpc_template" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "${var.environment}_vpc"
  }
}

#Public Subnet
resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.vpc_template.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name      = "${var.environment}_public_${each.key}"
    Public_IP = "Enabled"
  }
}

#Private Subnet
resource "aws_subnet" "private_subnets" {
  for_each = var.private_subnets

  vpc_id            = aws_vpc.vpc_template.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = "${var.environment}_private_${each.key}"
    Public_IP = "Disabled"
  }
}

#Internet Gateway & Route Table
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_template.id

  tags = {
    Name = "${var.environment}_internet_gateway"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_template.id

  tags = {
    Name = "${var.environment}_public_route_table"
  }
}

resource "aws_route" "public_igw_route" {
  route_table_id         = aws_route_table.public_route_table.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}

#Associate Public Subnets to Route Table
resource "aws_route_table_association" "public_route_association" {
  for_each = aws_subnet.public_subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route_table.id
}

#Private Route Table & Associations
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc_template.id

  tags = {
    Name = "${var.environment}_private_route_table"
  }
}

resource "aws_route_table_association" "private_route_association" {
  for_each = aws_subnet.private_subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_route_table.id
}


#NAT Gateway for Private Subnets
resource "aws_eip" "eip" {
  count  = var.create_nat || var.create_eip ? 1 : 0
  domain = "vpc"

  tags = {
    Name = "${var.environment}_eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  count         = var.create_nat ? 1 : 0
  allocation_id = aws_eip.eip[0].id
  subnet_id     = aws_subnet.public_subnets["public_management"].id

  tags = {
    Name = "${var.environment}_nat_gateway"
  }
}

resource "aws_route" "private_nat_route" {
  count                  = var.create_nat ? 1 : 0 #Create only if NAT is enabled
  route_table_id         = aws_route_table.private_route_table.id
  nat_gateway_id         = aws_nat_gateway.nat_gw[0].id
  destination_cidr_block = "0.0.0.0/0"
}