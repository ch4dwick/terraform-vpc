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

resource "aws_subnet" "terraform-vpc-subnet-public-ap-southeast-1a" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = "10.0.0.0/20"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "ap-southeast-1a"
  tags = {
    Name = "terraform-vpc-subnet-public-ap-southeast-1a"
  }
}

resource "aws_subnet" "terraform-vpc-subnet-public-ap-southeast-1b" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = "10.0.16.0/20"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "ap-southeast-1b"
  tags = {
    Name = "terraform-vpc-subnet-public-ap-southeast-1b"
  }
}

# Optional: If you need an additional zone
# resource "aws_subnet" "terraform-vpc-subnet-public-ap-southeast-1c" {
#   vpc_id                  = aws_vpc.terraform-vpc.id
#   cidr_block              = "10.0.32.0/20"
#   map_public_ip_on_launch = "true" //it makes this a public subnet
#   availability_zone       = "ap-southeast-1c"
#   tags = {
#     Name = "terraform-vpc-subnet-public-ap-southeast-1c"
#   }
# }

resource "aws_subnet" "terraform-vpc-subnet-private-ap-southeast-1a" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = "10.0.48.0/20"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1a"
  tags = {
    Name = "terraform-vpc-subnet-private-ap-southeast-1a"
  }
}

resource "aws_subnet" "terraform-vpc-subnet-private-ap-southeast-1b" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = "10.0.64.0/20"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1b"
  tags = {
    Name = "terraform-vpc-subnet-private-ap-southeast-1b"
  }
}

# Optional: If you need a 3rd private subnet AZ
# resource "aws_subnet" "terraform-vpc-subnet-private-ap-southeast-1c" {
#   vpc_id                  = aws_vpc.terraform-vpc.id
#   cidr_block              = "10.0.80.0/20"
#   map_public_ip_on_launch = false
#   availability_zone       = "ap-southeast-1c"
#   tags = {
#     Name = "terraform-vpc-subnet-private-ap-southeast-1c"
#   }
# }
