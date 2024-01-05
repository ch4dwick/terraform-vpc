resource "aws_vpc_endpoint" "s3" {
  vpc_id = aws_vpc.terraform-vpc.id
  route_table_ids = [
    aws_route_table.terraform-vpc-rtb-private-ap-southeast-1a.id,
    # aws_route_table.terraform-vpc-rtb-private-ap-southeast-1b.id
  ]
  service_name      = "com.amazonaws.ap-southeast-1.s3"
  vpc_endpoint_type = "Gateway"
  tags = {
    Name = "terraform-vpce-s3"
  }
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id             = aws_vpc.terraform-vpc.id
  vpc_endpoint_type  = "Interface"
  subnet_ids         = aws_subnet.terraform-vpc-subnet-public-ap-southeast-1.*.id
  service_name       = "com.amazonaws.ap-southeast-1.ec2messages"
  security_group_ids = [aws_security_group.terraform-vpc-sg.id]
  tags = {
    Name = "terraform-vpce-ec2messages"
  }
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id             = aws_vpc.terraform-vpc.id
  vpc_endpoint_type  = "Interface"
  subnet_ids         = aws_subnet.terraform-vpc-subnet-public-ap-southeast-1.*.id
  service_name       = "com.amazonaws.ap-southeast-1.ssm"
  security_group_ids = [aws_security_group.terraform-vpc-sg.id]
  tags = {
    Name = "terraform-vpce-ssm"
  }
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id             = aws_vpc.terraform-vpc.id
  vpc_endpoint_type  = "Interface"
  subnet_ids         = aws_subnet.terraform-vpc-subnet-public-ap-southeast-1.*.id
  service_name       = "com.amazonaws.ap-southeast-1.ssmmessages"
  security_group_ids = [aws_security_group.terraform-vpc-sg.id]
  tags = {
    Name = "terraform-vpce-ssmmessages"
  }
}
