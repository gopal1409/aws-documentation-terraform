# Terraform and AWS provider version constraints
terraform {
  required_version = ">= 1.15, < 2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.60"
    }
  }
}

# AWS provider configuration
# Authentication is intentionally not hard-coded. The provider uses the
# standard AWS credential chain (environment variables, shared config,
# IAM roles, OIDC, and other supported mechanisms).
provider "aws" {
  region = "us-east-1"
}
