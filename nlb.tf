resource "aws_lb" "terraform_nlb" {
  name                             = "terraform-nlb"
  load_balancer_type               = "network"
  internal                         = false
  subnets                          = aws_subnet.terraform-vpc-subnet-public-ap-southeast-1.*.id
  enable_cross_zone_load_balancing = true

  tags = {
    "Name" = "terraform-nlb"
  }
}


resource "aws_lb_target_group" "terraform_nlb_http_tg" {
  port              = 80
  protocol          = "TCP"
  vpc_id            = aws_vpc.terraform-vpc.id
  proxy_protocol_v2 = true

  depends_on = [
    aws_lb.terraform_nlb
  ]

  health_check {
    protocol = "TCP"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    "Name" = "HTTP"
  }
}

resource "aws_lb_target_group" "terraform_nlb_https_tg" {
  port              = 443
  protocol          = "TCP"
  vpc_id            = aws_vpc.terraform-vpc.id
  proxy_protocol_v2 = true

  depends_on = [
    aws_lb.terraform_nlb
  ]

  health_check {
    protocol = "TCP"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    "Name" = "HTTPS"
  }
}

resource "aws_lb_listener" "terraform_nlb_http_listener" {
  load_balancer_arn = aws_lb.terraform_nlb.arn

  protocol = "TCP"
  port     = 80

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform_nlb_http_tg.arn
  }

  tags = {
    "Name" = "HTTP"
  }
}

resource "aws_lb_listener" "terraform_nlb_https_listener" {
  load_balancer_arn = aws_lb.terraform_nlb.arn

  protocol = "TCP"
  port     = 443

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform_nlb_https_tg.arn
  }
  tags = {
    "Name" = "HTTPS"
  }
}

