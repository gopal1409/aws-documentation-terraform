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
# standard AWS credential chain.
provider "aws" {
  region = var.aws_region
}
