output "ec2_public_ip" {
  value = aws_instance.color_svr.public_ip
}