resource "aws_ecr_repository" "ecr_repo" {
  name = var.repository_name

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  image_tag_mutability = var.image_tag_mutability

  tags = var.tags != null ? var.tags : {}
}

resource "aws_ecr_lifecycle_policy" "ecr_policy" {
  repository = aws_ecr_repository.ecr_repo.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Remove all untagged images (keep only 1)"
        selection = {
          tagStatus     = "untagged"
          countType     = "imageCountMoreThan"
          countNumber   = 1
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}

