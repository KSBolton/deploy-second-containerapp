locals {
  convention   = "${var.prefix}-${var.env}"
  default_tags = var.default_tags
}

resource "aws_default_vpc" "net_space" {
  tags = merge(
    local.default_tags, {
      Name = "${local.convention}-default-vpc"
    }
  )
}

resource "aws_subnet" "pub_subnet" {
  vpc_id            = aws_default_vpc.net_space.id
  cidr_block        = var.pub_subnet_cidr
  availability_zone = var.azs.names[0]
  tags = merge(
    local.default_tags, {
      Name        = "${local.convention}-Public_SN1"
      Environment = var.env
    }
  )
}