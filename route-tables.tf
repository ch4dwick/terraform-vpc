resource "aws_route_table" "terraform-vpc-rtb-public1-ap-southeast-1a" {
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //RTB uses this IGW to reach internet
    gateway_id = aws_internet_gateway.terraform-vpc-igw.id
  }

  route {
    //associated subnet can reach everywhere
    ipv6_cidr_block = "::/0"
    //RTB uses this IGW to reach internet
    gateway_id = aws_internet_gateway.terraform-vpc-igw.id
  }

  tags = {
    Name = "terraform-vpc-rtb-public1-ap-southeast-1a"
  }
}

# Associate above RTB to VPC subnet.
resource "aws_route_table_association" "terraform-vpc-rtb-public1-ap-southeast-1a-assoc" {
  subnet_id      = aws_subnet.terraform-vpc-subnet-public1-ap-southeast-1a.id
  route_table_id = aws_route_table.terraform-vpc-rtb-public1-ap-southeast-1a.id
}

resource "aws_route_table" "terraform-vpc-rtb-public2-ap-southeast-1b" {
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.terraform-vpc-igw.id
  }

  route {
    //associated subnet can reach everywhere
    ipv6_cidr_block = "::/0"
    //RTB uses this IGW to reach internet
    gateway_id = aws_internet_gateway.terraform-vpc-igw.id
  }

  tags = {
    Name = "terraform-vpc-rtb-public2-ap-southeast-1b"
  }
}

# Associate above RTB to VPC subnet.
resource "aws_route_table_association" "terraform-vpc-rtb-public2-ap-southeast-1b-assoc" {
  subnet_id      = aws_subnet.terraform-vpc-subnet-public2-ap-southeast-1b.id
  route_table_id = aws_route_table.terraform-vpc-rtb-public2-ap-southeast-1b.id
}

resource "aws_route_table" "terraform-vpc-rtb-private1-ap-southeast-1a" {
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.terraform-nat-public1-ap-southeast-1a.id
  }

  route {
    //associated subnet can reach everywhere
    ipv6_cidr_block = "::/0"
    //RTB uses this IGW to reach internet
    gateway_id = aws_egress_only_internet_gateway.terraform-vpc-egw.id
  }

  tags = {
    Name = "terraform-vpc-rtb-private1-ap-southeast-1a"
  }
}

# Associate above RTB to VPC subnet.
resource "aws_route_table_association" "terraform-vpc-rtb-private1-ap-southeast-1a-assoc" {
  subnet_id      = aws_subnet.terraform-vpc-subnet-private1-ap-southeast-1a.id
  route_table_id = aws_route_table.terraform-vpc-rtb-private1-ap-southeast-1a.id
}

resource "aws_route_table" "terraform-vpc-rtb-private2-ap-southeast-1b" {
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.terraform-nat-public1-ap-southeast-1a.id
  }

  route {
    //associated subnet can reach everywhere
    ipv6_cidr_block = "::/0"
    //RTB uses this IGW to reach internet
    gateway_id = aws_egress_only_internet_gateway.terraform-vpc-egw.id
  }

  tags = {
    Name = "terraform-vpc-rtb-private2-ap-southeast-1b"
  }
}

# Associate above RTB to VPC subnet.
resource "aws_route_table_association" "terraform-vpc-rtb-private1-ap-southeast-1b-assoc" {
  subnet_id      = aws_subnet.terraform-vpc-subnet-private2-ap-southeast-1b.id
  route_table_id = aws_route_table.terraform-vpc-rtb-private2-ap-southeast-1b.id
}
