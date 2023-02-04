variable "default_tags" {
  type        = map(any)
  description = "Default tags to be applied to all AWS resources"
}

variable "prefix" {
  type        = string
  description = "Name prefix"
}

variable "pub_subnet_cidr" {
  type        = string
  description = "Provision private subnet CIDRs in custom VPC"
}

variable "env" {
  type        = string
  description = "Deployment Environment"
}

variable "azs" {
  description = "Results from AZ data block"
}

variable "ami" {
  description = "Amazon Linux AMI ID"
}

variable "instance_type" {
  description = "EC2 type"
}