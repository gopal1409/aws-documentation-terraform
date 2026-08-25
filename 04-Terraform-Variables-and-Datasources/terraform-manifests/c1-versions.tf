# Terraform and provider version constraints
terraform {
  required_version = ">= 1.6, < 2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 7.0"
    }
  }
}

# AWS provider configuration
# Authentication is intentionally not hard-coded here. The provider uses
# the standard AWS credential chain.
provider "aws" {
  region = var.aws_region
}
