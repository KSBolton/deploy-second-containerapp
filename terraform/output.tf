output "ecr_repo_url" {
  value = module.ecr.ecr_repo_url
}

output "color_server_public_ip" {
  value = module.infra.ec2_public_ip
}