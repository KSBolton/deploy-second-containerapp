resource "aws_key_pair" "infra_key" {
  key_name   = "${local.convention}-key"
  public_key = file("./keys/key.pub")
}