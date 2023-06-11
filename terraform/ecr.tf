resource "aws_ecr_repository" "go-app" {
  name = var.ecr_repository_name

  image_scanning_configuration {
    scan_on_push = false

  }
}