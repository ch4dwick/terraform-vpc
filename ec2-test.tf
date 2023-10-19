# # This section is optional. You may or may not want to create a test instance.
# resource "aws_instance" "terraform-ec2-public-test" {
#   ami                    = "<your ami>"
#   vpc_security_group_ids = [aws_security_group.terraform-vpc-sg.id]
#   availability_zone      = "ap-southeast-1a"
#   instance_type          = "t2.micro"
#   private_ip             = "10.0.1.1"

#   tags = {
#     Name = "terraform-ec2-public-test"
#   }
#   subnet_id            = aws_subnet.terraform-vpc-subnet-public-ap-southeast-1a.id
#   iam_instance_profile = "<custom delegated IAM role>"
# }

# # EC2 VM deployed in private subnet on AZ 2 and AWS-assigned ip.
# resource "aws_instance" "terraform-ec2-private-test" {
#   ami                    = "<your ami>"
#   vpc_security_group_ids = [aws_security_group.terraform-vpc-sg.id]
#   availability_zone      = "ap-southeast-1b"
#   instance_type          = "t2.micro"

#   tags = {
#     Name = "terraform-ec2-private-test"
#   }
#   subnet_id            = aws_subnet.terraform-vpc-subnet-private-ap-southeast-1b.id
#   iam_instance_profile = "<custom delegated IAM role>"
# }
