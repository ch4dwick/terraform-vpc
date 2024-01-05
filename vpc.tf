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

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.terraform-vpc.id]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
  # Optional: Remove if you need an additional zone
  exclude_names = ["ap-southeast-1c"]
}

variable "public-subnets" {
  type        = list(string)
  description = "Subnet Ranges"
  default     = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
}

variable "private-subnets" {
  type        = list(string)
  description = "Subnet Ranges"
  default     = ["10.0.48.0/20", "10.0.64.0/20", "10.0.80.0/20"]
}

resource "aws_subnet" "terraform-vpc-subnet-public-ap-southeast-1" {
  count                           = length(data.aws_availability_zones.available.names)
  vpc_id                          = aws_vpc.terraform-vpc.id
  cidr_block                      = var.public-subnets[count.index]
  map_public_ip_on_launch         = true //it makes this a public subnet
  availability_zone               = data.aws_availability_zones.available.names[count.index]
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block                 = aws_vpc.terraform-vpc.ipv6_cidr_block
  tags = {
    Name = "terraform-vpc-subnet-public-ap-southeast-1"

  }
}

resource "aws_subnet" "terraform-vpc-subnet-private-ap-southeast-1" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.private-subnets[count.index]
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  ipv6_cidr_block         = aws_vpc.terraform-vpc.ipv6_cidr_block
  tags = {
    Name = "terraform-vpc-subnet-private-ap-southeast-1"
  }
}
