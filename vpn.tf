# Optional. This is so you can access EC2 instances behind a private subnet.

# Currently beyond the scope of this commit.
# resource "aws_acm_certificate" "terraform-vpn-cert" {

# }

# resource "aws_ec2_client_vpn_endpoint" "terraform-ec2-client-vpn" {
#   description            = "Provides secure access for instances in the private subnet."
#   server_certificate_arn = aws_acm_certificate.terraform-vpn-cert.arn
#   client_cidr_block      = "128.0.0.0/22"

#   vpc_id             = aws_vpc.terraform-vpc.id
#   security_group_ids = [aws_security_group.terraform-vpc-sg.id]

#   authentication_options {
#     type                       = "certificate-authentication"
#     root_certificate_chain_arn = aws_acm_certificate.terraform-vpn-cert.terraform-vpn-cert.arn
#   }

#   connection_log_options {
#     enabled = false
#   }
#   tags = {
#     Name = "Terraform VPN Client Endpoint"
#   }
# }

# # For private subnet 1
# resource "aws_ec2_client_vpn_network_association" "terraform-ec2-vpne-subnet-assoc1" {
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.terraform-ec2-client-vpn.id
#   subnet_id              = aws_subnet.terraform-vpc-subnet-private1-ap-southeast-1a.id

#   # VPN Assets take time to tear down. Increase timeout.
#   timeouts {
#     delete = "10m"
#     create = "10m"
#   }
# }

# # For private subnet 2
# resource "aws_ec2_client_vpn_network_association" "terraform-ec2-vpne-subnet-assoc2" {
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.terraform-ec2-client-vpn.id
#   subnet_id              = aws_subnet.terraform-vpc-subnet-private2-ap-southeast-1b.id

#   # VPN Assets take time to tear down. Increase timeout.
#   timeouts {
#     delete = "10m"
#     create = "10m"
#   }
# }

# # Not usually needed but it's to prevent users from losing their internet when using the VPN Client.
# resource "aws_ec2_client_vpn_route" "subnet1-web-route" {
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.terraform-ec2-client-vpn.id
#   destination_cidr_block = "0.0.0.0/0"
#   target_vpc_subnet_id   = aws_subnet.terraform-vpc-subnet-private1-ap-southeast-1a.id

#   # VPN Assets take time to tear down. Increase timeout.
#   timeouts {
#     delete = "10m"
#     create = "10m"
#   }
# }

# # Probably not needed.
# resource "aws_ec2_client_vpn_route" "subnet2-web-route" {
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.terraform-ec2-client-vpn.id
#   destination_cidr_block = "0.0.0.0/0"
#   target_vpc_subnet_id   = aws_subnet.terraform-vpc-subnet-private2-ap-southeast-1b.id

#   # VPN Assets take time to tear down. Increase timeout.
#   timeouts {
#     delete = "10m"
#     create = "10m"
#   }
# }

# resource "aws_ec2_client_vpn_authorization_rule" "terraform-vpn-auth-rule-subnet1" {
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.terraform-ec2-client-vpn.id
#   target_network_cidr    = aws_subnet.terraform-vpc-subnet-private1-ap-southeast-1a.cidr_block
#   description            = "Authorize access to VPC subnet 1"
#   authorize_all_groups   = true
# }

# resource "aws_ec2_client_vpn_authorization_rule" "terraform-vpn-auth-rule-subnet2" {
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.terraform-ec2-client-vpn.id
#   target_network_cidr    = aws_subnet.terraform-vpc-subnet-private2-ap-southeast-1b.cidr_block
#   description            = "Authorize access to VPC subnet 2"
#   authorize_all_groups   = true
# }
# resource "aws_ec2_client_vpn_authorization_rule" "terraform-vpn-auth-rule-internet" {
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.terraform-ec2-client-vpn.id
#   target_network_cidr    = "0.0.0.0/0"
#   description            = "Authorize access to Internet Passthrough"
#   authorize_all_groups   = true
# }
