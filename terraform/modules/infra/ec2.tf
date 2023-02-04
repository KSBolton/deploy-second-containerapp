data "aws_iam_instance_profile" "LabRole" {
  name = "LabInstanceProfile"
}

resource "aws_instance" "color_svr" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.infra_key.key_name
  subnet_id                   = aws_subnet.pub_subnet.id
  vpc_security_group_ids      = [aws_security_group.vm_ssh_http.id]
  associate_public_ip_address = true
  iam_instance_profile        = data.aws_iam_instance_profile.LabRole.name
  user_data                   = file("./setup_docker.sh")

  tags = merge(local.default_tags,
    {
      "Name" = "${local.convention}-color-svr"
    }
  )
}
