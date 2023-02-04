module "globalvars" {
  source = "./modules/globalvars"
}

module "ecr" {
  source       = "./modules/ecr"
  default_tags = module.globalvars.default_tags
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

