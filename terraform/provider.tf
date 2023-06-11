provider "aws" {
  region                   = var.aws_region
  shared_config_files      = ["C:\\Users\\gnaty\\.aws\\config"]
  shared_credentials_files = ["C:\\Users\\gnaty\\.aws\\credentials"]
}


# Configure the GitHub Provider
provider "github" {
  token = var.github_token
}
