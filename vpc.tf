resource "aws_vpc_endpoint" "s3" {
  vpc_id = aws_vpc.terraform-vpc.id
  route_table_ids = [aws_route_table.terraform-vpc-rtb-private1-ap-southeast-1a.id,
  aws_route_table.terraform-vpc-rtb-private2-ap-southeast-1b.id]
  service_name      = "com.amazonaws.ap-southeast-1.s3"
  vpc_endpoint_type = "Gateway"
  tags = {
    Name = "terraform-vpce-s3"
  }
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id            = aws_vpc.terraform-vpc.id
  vpc_endpoint_type = "Interface"
  subnet_ids = [aws_subnet.terraform-vpc-subnet-private1-ap-southeast-1a.id,
  aws_route_table.terraform-vpc-rtb-private2-ap-southeast-1b.id]
  service_name       = "com.amazonaws.ap-southeast-1.ec2messages"
  security_group_ids = [aws_security_group.terraform-vpc-sg.id]
  tags = {
    Name = "terraform-vpce-ec2messages"
  }
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.terraform-vpc.id
  vpc_endpoint_type = "Interface"
  subnet_ids = [aws_subnet.terraform-vpc-subnet-private1-ap-southeast-1a.id,
  aws_route_table.terraform-vpc-rtb-private2-ap-southeast-1b.id]
  service_name       = "com.amazonaws.ap-southeast-1.ssm"
  security_group_ids = [aws_security_group.terraform-vpc-sg.id]
  tags = {
    Name = "terraform-vpce-ssm"
  }
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id            = aws_vpc.terraform-vpc.id
  vpc_endpoint_type = "Interface"
  subnet_ids = [aws_subnet.terraform-vpc-subnet-private1-ap-southeast-1a.id,
  aws_route_table.terraform-vpc-rtb-private2-ap-southeast-1b.id]
  service_name       = "com.amazonaws.ap-southeast-1.ssmmessages"
  security_group_ids = [aws_security_group.terraform-vpc-sg.id]
  tags = {
    Name = "terraform-vpce-ssmmessages"
  }
}

resource "aws_vpc" "terraform-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraform-vpc"
    env  = "test"
  }
}

resource "aws_subnet" "terraform-vpc-subnet-public1-ap-southeast-1a" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = "10.0.0.0/20"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "ap-southeast-1a"
  tags = {
    Name = "terraform-vpc-subnet-public1-ap-southeast-1a"
  }
}

resource "aws_subnet" "terraform-vpc-subnet-public2-ap-southeast-1b" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = "10.0.16.0/20"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "ap-southeast-1b"
  tags = {
    Name = "terraform-vpc-subnet-public2-ap-southeast-1b"
  }
}

resource "aws_subnet" "terraform-vpc-subnet-private1-ap-southeast-1a" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = "10.0.128.0/20"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1a"
  tags = {
    Name = "terraform-vpc-subnet-private1-ap-southeast-1a"
  }
}

resource "aws_subnet" "terraform-vpc-subnet-private2-ap-southeast-1b" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = "10.0.144.0/20"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1b"
  tags = {
    Name = "terraform-vpc-subnet-private2-ap-southeast-1b"
  }
}
