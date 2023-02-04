resource "aws_ecr_repository" "ecr_repo" {
  count                = 2
  name                 = var.repo_names[count.index]
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.default_tags
}