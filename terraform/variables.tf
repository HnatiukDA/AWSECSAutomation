variable "ecr_repository_name" {
  type    = string
  default = "golang-application"
}

variable "aws_region" {
  type    = string
  default = "us-east-2"
}

# variable "github_token" {
#   type    = string
#   sensitive   = true
# }