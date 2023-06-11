resource "aws_iam_user" "gh" {
  name = "github-actions"
}

resource "aws_iam_access_key" "gh" {
  user = aws_iam_user.gh.name
}

data "aws_iam_policy_document" "gh_ro" {
  statement {
    effect = "Allow"
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeImages",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]
    resources = [aws_ecr_repository.go-app.arn] # ["*"] # arn ECR
  }

  statement {
    effect    = "Allow"
    actions   = ["ecr:GetAuthorizationToken"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "gh_ro" {
  name   = "AllowPushECR"
  user   = aws_iam_user.gh.name
  policy = data.aws_iam_policy_document.gh_ro.json
}
