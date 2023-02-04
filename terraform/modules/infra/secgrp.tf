data "http" "admin_public_ip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "vm_ssh_http" {
  name   = "${local.convention}_ssh_http"
  vpc_id = aws_default_vpc.net_space.id

  ingress {
    description = "SSH from admins"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.admin_public_ip.response_body)}/32", "99.224.0.0/11"]
  }

  ingress {
    description = "HTTP from all to colorful server"
    from_port   = 8081
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.default_tags,
    {
      "Name" = "${local.convention}_vm_ssh_http"
    }
  )
}