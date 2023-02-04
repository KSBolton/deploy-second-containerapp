provider "aws" {
  region = module.globalvars.region
}

terraform {
  backend "s3" {
    bucket = "tf-state-kbolton3"
    key    = "assign1-terraform.tfstate"
    region = "us-east-1"
  }
}