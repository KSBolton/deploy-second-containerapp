data "aws_subnets" "us-east-1b" {
  filter {
    name   = "availability-zone"
    values = ["us-east-1b"] 
  }
}

resource "aws_lb" "color_lb" {
  name               = "${var.prefix}-LB"
  security_groups    = [var.secgrp_id]
  subnets            = [var.subnet_id, data.aws_subnets.us-east-1b.ids[0]]
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  internal           = false  #tfsec:ignore:aws-elb-alb-not-public
  drop_invalid_header_fields = true
  tags = merge(var.default_tags,
    {
      Name = "${var.prefix}-LB"
      env  = var.env
  })
}


resource "aws_lb_listener" "color_lb_listener" {
  load_balancer_arn = aws_lb.color_lb.arn
  port              = "80"
  protocol          = "HTTP" #tfsec:ignore:aws-elb-http-not-used

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lime_8083.arn
  }
  tags = merge(var.default_tags,
    {
      Name = "${var.prefix}-LB-Listener"
      env  = var.env
  })
}

resource "aws_lb_listener_rule" "color_lb_blue_rule" {
  listener_arn = aws_lb_listener.color_lb_listener.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue_8081.arn
  }

  condition {
    query_string {
      key = "color"
      value = "blue"
    }
  }
}

resource "aws_lb_listener_rule" "color_lb_pink_rule" {
  listener_arn = aws_lb_listener.color_lb_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pink_8082.arn
  }

  condition {
    query_string {
      key = "color"
      value = "pink"
    }
  }
}

resource "aws_lb_listener_rule" "color_lb_lime_rule" {
  listener_arn = aws_lb_listener.color_lb_listener.arn
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lime_8083.arn
  }

  condition {
    query_string {
      key = "color"
      value = "lime"
    }
  }
}
