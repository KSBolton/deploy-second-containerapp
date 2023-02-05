output "ec2_public_ip" {
  value = aws_instance.color_svr.public_ip
}

output "lb_http_secgrp" {
  value = aws_security_group.lb_http.id
}

output "public_subnet" {
  value = aws_subnet.pub_subnet.id
}

output "vpc_id" {
  value = aws_default_vpc.net_space.id
}

output "aws_instance_id" {
  value = aws_instance.color_svr.id
}