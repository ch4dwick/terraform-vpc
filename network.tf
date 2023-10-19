
resource "aws_internet_gateway" "terraform-vpc-igw" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = "terraform-vpc-igw"
  }
}

resource "aws_egress_only_internet_gateway" "terraform-vpc-egw" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform-vpc-egw"
  }
}

# To be used for the NAT that follows
resource "aws_eip" "terraform-nat-public-ap-southeast-1a-eip" {
  domain = "vpc"
  tags = {
    Name = "terraform-nat-public-ap-southeast-1a-eip"
  }
}

resource "aws_nat_gateway" "terraform-nat-public-ap-southeast-1a" {
  connectivity_type = "public"
  allocation_id     = aws_eip.terraform-nat-public-ap-southeast-1a-eip.id
  subnet_id         = aws_subnet.terraform-vpc-subnet-public-ap-southeast-1a.id

  tags = {
    Name = "terraform-nat-ap-southeast-1a"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.terraform-vpc-igw]
}
