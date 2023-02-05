variable "default_tags" {
  type        = map(any)
  description = "Default tags to be applied to all AWS resources"
}

variable "secgrp_id" {
  description = "Security group used for EC2 and ALB"
}

variable "subnet_id" {
  description = "Public subnet for project."
}

variable "prefix" {
  type        = string
  description = "Name prefix"
}

variable "env" {
  type        = string
  description = "Deployment Environment"
}

variable "vpc_id" {
  type        = string
  description = "Deployment VPC"
}

variable "color_svr_id" {
  type        = string
  description = "EC2 instance ID for color server"
}