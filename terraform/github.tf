resource "github_actions_secret" "AWS_ACCESS_KEY_ID" {
  repository      = "DmytroHnatiukTestTaskSoftcery"
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = aws_iam_access_key.gh.id
}

resource "github_actions_secret" "AWS_SECRET_ACCESS_KEY" {
  repository      = "DmytroHnatiukTestTaskSoftcery"
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = aws_iam_access_key.gh.secret
}

resource "github_actions_variable" "ecr_repository_name" {
  repository    = "DmytroHnatiukTestTaskSoftcery"
  variable_name = "ECR_REPOSITORY_NAME"
  value         = aws_ecr_repository.go-app.name
}

resource "github_actions_variable" "aws_region" {
  repository    = "DmytroHnatiukTestTaskSoftcery"
  variable_name = "AWS_REGION"
  value         = var.aws_region
}
