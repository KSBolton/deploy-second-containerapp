resource "aws_lb_target_group" "blue_8081" {
  name        = "${var.prefix}-blue-TargetGroup"
  port        = 8081
  target_type = "instance"
  protocol    = "HTTP"
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    port                = 8081
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2

  }
  vpc_id = var.vpc_id
  
  tags = merge(var.default_tags,
    {
      Name = "${var.prefix}-blue-Target-Group"
      env  = var.env
  })
}

resource "aws_lb_target_group" "pink_8082" {
  name        = "${var.prefix}-pink-TargetGroup"
  port        = 8082
  target_type = "instance"
  protocol    = "HTTP"
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    port                = 8082
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2

  }
  vpc_id = var.vpc_id
  
  tags = merge(var.default_tags,
    {
      Name = "${var.prefix}-pink-Target-Group"
      env  = var.env
  })
}

resource "aws_lb_target_group" "lime_8083" {
  name        = "${var.prefix}-lime-TargetGroup"
  port        = 8083
  target_type = "instance"
  protocol    = "HTTP"
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    port                = 8083
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2

  }
  vpc_id = var.vpc_id
  
  tags = merge(var.default_tags,
    {
      Name = "${var.prefix}-lime-Target-Group"
      env  = var.env
  })
}

resource "aws_lb_target_group_attachment" "blue_8081" {
  target_group_arn = aws_lb_target_group.blue_8081.arn
  target_id        = var.color_svr_id
  port             = 8081
}

resource "aws_lb_target_group_attachment" "pink_8082" {
  target_group_arn = aws_lb_target_group.pink_8082.arn
  target_id        = var.color_svr_id
  port             = 8082
}

resource "aws_lb_target_group_attachment" "lime_8083" {
  target_group_arn = aws_lb_target_group.lime_8083.arn
  target_id        = var.color_svr_id
  port             = 8083
}
