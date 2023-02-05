module "globalvars" {
  source = "./modules/globalvars"
}

module "ecr" {
  source       = "./modules/ecr"
  default_tags = module.globalvars.default_tags
}

module "alb" {
  source       = "./modules/alb"
  secgrp_id    = module.infra.lb_http_secgrp
  subnet_id    = module.infra.public_subnet
  prefix       = module.globalvars.prefix
  default_tags = module.globalvars.default_tags
  env          = var.env
  vpc_id       = module.infra.vpc_id
  color_svr_id = module.infra.aws_instance_id
}

module "infra" {
  source          = "./modules/infra"
  env             = var.env
  pub_subnet_cidr = var.pub_subnet_cidr
  prefix          = module.globalvars.prefix
  default_tags    = module.globalvars.default_tags
  azs             = data.aws_availability_zones.azs
  ami             = data.aws_ami.latest_amazon_linux.id
  instance_type   = var.instance_type
}

data "aws_availability_zones" "azs" {
  state = "available"

  filter {
    name   = "region-name"
    values = ["${module.globalvars.region}"]
  }
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

