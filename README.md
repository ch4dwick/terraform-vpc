# AWS VPC Terraform Cookbook

# Introduction

These files are based off the "Create VPC with subnets" option with two AZs, two public and two private subnets, one NAT gateway, VPN Client Endpoint with authorization to private subnets and internet pass-through, and a VPCE S3 Gateway.

### The following resources are created by these scripts (terraform state list):

- aws_egress_only_internet_gateway.terraform-vpc-egw
- aws_eip.terraform-nat-public-ap-southeast-1a-eip
- aws_internet_gateway.terraform-vpc-igw
- aws_nat_gateway.terraform-nat-public-ap-southeast-1a
- aws_route_table.terraform-vpc-rtb-private-ap-southeast-1a
- aws_route_table.terraform-vpc-rtb-private-ap-southeast-1b
- aws_route_table.terraform-vpc-rtb-public-ap-southeast-1a
- aws_route_table.terraform-vpc-rtb-public-ap-southeast-1b
- aws_route_table_association.terraform-vpc-rtb-private-ap-southeast-1a-assoc
- aws_route_table_association.terraform-vpc-rtb-private-ap-southeast-1b-assoc
- aws_route_table_association.terraform-vpc-rtb-public-ap-southeast-1a-assoc
- aws_route_table_association.terraform-vpc-rtb-public-ap-southeast-1b-assoc
- aws_security_group.terraform-vpc-sg
- aws_subnet.terraform-vpc-subnet-private-ap-southeast-1a
- aws_subnet.terraform-vpc-subnet-private-ap-southeast-1b
- aws_subnet.terraform-vpc-subnet-public-ap-southeast-1a
- aws_subnet.terraform-vpc-subnet-public-ap-southeast-1b
- aws_vpc.terraform-vpc
- aws_vpc_endpoint.s3

### The following are created for SSM access to EC2 instances in the private subnet as per documentation. You may skip this if you don't need it.

- aws_vpc_endpoint.ec2messages
- aws_vpc_endpoint.ssm
- aws_vpc_endpoint.ssmmessages

### The following are completely optional resources

- aws_instance.terraform-ec2-private-test
- aws_instance.terraform-ec2-public-test
- aws_ec2_client_vpn_endpoint.terraform-ec2-client-vpn
- aws_ec2_client_vpn_network_association.terraform-ec2-vpne-subnet-assoc1
- aws_ec2_client_vpn_network_association.terraform-ec2-vpne-subnet-assoc2
- aws_ec2_client_vpn_route.subnet1-web-route
- aws_ec2_client_vpn_route.subnet2-web-route
- aws_ec2_client_vpn_authorization_rule.terraform-vpn-auth-rule-subnet1
- aws_ec2_client_vpn_authorization_rule.terraform-vpn-auth-rule-subnet2
- aws_ec2_client_vpn_authorization_rule.terraform-vpn-auth-rule-internet

# How to use

## Initialize

> terraform init

After cherry-picking or tweaking the files to your needs:

## Validate

> terraform validate

## Apply Plan

> terraform apply

## Disclaimer:

This is a work in progress. I am by no means an expert on networking or on AWS. All of the configuration defined here are best-guess or defaults. I take no responsibility for any incurred costs resulting from the AWS resources created by these files.
