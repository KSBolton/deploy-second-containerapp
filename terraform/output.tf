output "ecr_repo_url" {
  value = module.ecr.ecr_repo_url
}

output "color_server_public_ip" {
  value = module.infra.ec2_public_ip
}

output "color_lb_dns_name" {
  value = module.alb.alb_dns
}