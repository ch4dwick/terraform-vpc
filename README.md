# AWS VPC Terraform Cookbook

# Introduction

These files are based off the "Create VPC with subnets" option with two AZs, two public and two private subnets, one NAT gateway, and a VPCE S3 Gateway.

The following resources are created by these scripts:
- aws_egress_only_internet_gateway.terraform-vpc-egw
- aws_eip.terraform-nat-public1-ap-southeast-1a-eip
- aws_instance.terraform-ec2-public-test
- aws_internet_gateway.terraform-vpc-igw
- aws_nat_gateway.terraform-nat-public1-ap-southeast-1a
- aws_route_table.terraform-vpc-rtb-private1-ap-southeast-1a
- aws_route_table.terraform-vpc-rtb-private2-ap-southeast-1b
- aws_route_table.terraform-vpc-rtb-public1-ap-southeast-1a
- aws_route_table.terraform-vpc-rtb-public2-ap-southeast-1b
- aws_route_table_association.terraform-vpc-rtb-private1-ap-southeast-1a-assoc
- aws_route_table_association.terraform-vpc-rtb-private1-ap-southeast-1b-assoc
- aws_route_table_association.terraform-vpc-rtb-public1-ap-southeast-1a-assoc
- aws_route_table_association.terraform-vpc-rtb-public2-ap-southeast-1b-assoc
- aws_security_group.terraform-vpc-sg
- aws_subnet.terraform-vpc-subnet-private1-ap-southeast-1a
- aws_subnet.terraform-vpc-subnet-private2-ap-southeast-1b
- aws_subnet.terraform-vpc-subnet-public1-ap-southeast-1a
- aws_subnet.terraform-vpc-subnet-public2-ap-southeast-1b
- aws_vpc.terraform-vpc
- aws_vpc_endpoint.s3

### The following are created for SSM access as per documentation. You may skip this if you don't need it.
- aws_vpc_endpoint.ec2messages
- aws_vpc_endpoint.ssm
- aws_vpc_endpoint.ssmmessages

## Disclaimer:

This is a work in progress. I am by no means an expert on networking or on AWS. All of the configuration defined here are best-guess or defaults. I take no responsibility for any incurred costs resulting from the AWS resources created by these files. 
