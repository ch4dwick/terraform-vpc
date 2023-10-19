# aws_vpc creates a default rtb. We can map the Internet Gateway so the vpc has internet.
resource "aws_default_route_table" "terraform-vpc-default-route-table" {
  default_route_table_id = aws_vpc.terraform-vpc.default_route_table_id

  route {
    # associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    # RTB uses this IGW to reach internet
    gateway_id = aws_internet_gateway.terraform-vpc-igw.id
  }

  route {
    # ipv6
    ipv6_cidr_block = "::/0"
    # RTB uses this IGW to reach internet
    gateway_id = aws_internet_gateway.terraform-vpc-igw.id
  }

  tags = {
    Name = "terraform-vpc-default-rtb"
  }
}

# Associate above RTB to VPC subnet. This use case uses one RTB for all subnets.
resource "aws_route_table_association" "terraform-vpc-rtb-public-ap-southeast-1a-assoc" {
  subnet_id      = aws_subnet.terraform-vpc-subnet-public-ap-southeast-1a.id
  route_table_id = aws_default_route_table.terraform-vpc-default-route-table.id
}

resource "aws_route_table_association" "terraform-vpc-rtb-public-ap-southeast-1b-assoc" {
  subnet_id      = aws_subnet.terraform-vpc-subnet-public-ap-southeast-1b.id
  route_table_id = aws_default_route_table.terraform-vpc-default-route-table.id
}


# Optional: If you want a route table for every public subnet.
# resource "aws_route_table" "terraform-vpc-rtb-public-ap-southeast-1a" {
#   vpc_id = aws_vpc.terraform-vpc.id

#   route {
#     # associated subnet can reach everywhere
#     cidr_block = "0.0.0.0/0"
#     # RTB uses this IGW to reach internet
#     gateway_id = aws_internet_gateway.terraform-vpc-igw.id
#   }

#   route {
#     # ipv6
#     ipv6_cidr_block = "::/0"
#     # RTB uses this IGW to reach internet
#     gateway_id = aws_internet_gateway.terraform-vpc-igw.id
#   }

#   tags = {
#     Name = "terraform-vpc-rtb-public-ap-southeast-1a"
#   }
# }

# Associate above RTB to VPC subnet using the route table above.
# resource "aws_route_table_association" "terraform-vpc-rtb-public-ap-southeast-1a-assoc" {
#   subnet_id      = aws_subnet.terraform-vpc-subnet-public-ap-southeast-1a.id
#   route_table_id = aws_default_route_table.terraform-vpc-rtb-public-ap-southeast-1a.id
# }

# resource "aws_route_table" "terraform-vpc-rtb-public-ap-southeast-1b" {
#   vpc_id = aws_vpc.terraform-vpc.id

#   route {
#     # associated subnet can reach everywhere
#     cidr_block = "0.0.0.0/0"
#     # CRT uses this IGW to reach internet
#     gateway_id = aws_internet_gateway.terraform-vpc-igw.id
#   }

#   route {
#     # ipv6
#     ipv6_cidr_block = "::/0"
#     # RTB uses this IGW to reach internet
#     gateway_id = aws_internet_gateway.terraform-vpc-igw.id
#   }

#   tags = {
#     Name = "terraform-vpc-rtb-public-ap-southeast-1b"
#   }
# }

# Associate above RTB to VPC subnet.
# resource "aws_route_table_association" "terraform-vpc-rtb-public-ap-southeast-1b-assoc" {
#   subnet_id      = aws_subnet.terraform-vpc-subnet-public-ap-southeast-1b.id
#   route_table_id = aws_route_table.terraform-vpc-rtb-public-ap-southeast-1b.id
# }

# Route table for private subnet
resource "aws_route_table" "terraform-vpc-rtb-private-ap-southeast-1a" {
  vpc_id = aws_vpc.terraform-vpc.id

  # NAT instead of IGW for private subnets
  route {
    # associated subnet can reach everywhere
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform-nat-public-ap-southeast-1a.id
  }

  # ipv6
  route {
    ipv6_cidr_block = "::/0"
    # RTB uses this EGW to reach internet
    egress_only_gateway_id = aws_egress_only_internet_gateway.terraform-vpc-egw.id
  }

  tags = {
    Name = "terraform-vpc-rtb-private-ap-southeast-1a"
  }
}

# Associate above RTB to VPC subnet. This use case uses one RTB for all subnets.
resource "aws_route_table_association" "terraform-vpc-rtb-private-ap-southeast-1a-assoc" {
  subnet_id      = aws_subnet.terraform-vpc-subnet-private-ap-southeast-1a.id
  route_table_id = aws_route_table.terraform-vpc-rtb-private-ap-southeast-1a.id
}

# Comment out if you're using the route table below.
resource "aws_route_table_association" "terraform-vpc-rtb-private-ap-southeast-1b-assoc" {
  subnet_id      = aws_subnet.terraform-vpc-subnet-private-ap-southeast-1b.id
  route_table_id = aws_route_table.terraform-vpc-rtb-private-ap-southeast-1a.id
}

# Optional: If you want a route table for every private subnet.
# resource "aws_route_table" "terraform-vpc-rtb-private-ap-southeast-1b" {
#   vpc_id = aws_vpc.terraform-vpc.id

#   route {
#     # associated subnet can reach everywhere
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.terraform-nat-public-ap-southeast-1a.id
#   }

#   route {
#     # ipv6
#     ipv6_cidr_block = "::/0"
#     # RTB uses this IGW to reach internet
#     egress_only_gateway_id = aws_egress_only_internet_gateway.terraform-vpc-egw.id
#   }

#   tags = {
#     Name = "terraform-vpc-rtb-private-ap-southeast-1b"
#   }
# }

# Associate above RTB to VPC subnet.
# resource "aws_route_table_association" "terraform-vpc-rtb-private-ap-southeast-1b-assoc" {
#   subnet_id      = aws_subnet.terraform-vpc-subnet-private-ap-southeast-1b.id
#   route_table_id = aws_route_table.terraform-vpc-rtb-private-ap-southeast-1b.id
# }
