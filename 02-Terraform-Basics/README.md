# Terraform Basics

This section establishes the foundation for working with modern Terraform and AWS.

## Lessons

- `02-01` — install Terraform CLI, AWS CLI v2 and VS Code
- `02-02` — Terraform CLI commands and the execution lifecycle
- `02-03` — Terraform language syntax and configuration blocks

## Standard workflow

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

Use `terraform plan` to review changes before applying them.

## Recommended versioning

Pin the Terraform CLI version used by a lab or CI pipeline and declare a provider constraint such as:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.60"
    }
  }
}
```

Keep the dependency lock file (`.terraform.lock.hcl`) under version control for reproducible provider selection.

## AWS authentication

Use the AWS credential chain instead of hard-coded credentials:

```bash
aws sts get-caller-identity
```

For local labs, an AWS CLI profile is preferable to putting secrets in Terraform variables. For CI/CD, prefer OIDC/web identity or an IAM role with short-lived credentials.

## State and safety

Never commit `terraform.tfstate`, `.tfstate.backup`, plan files, `.tfvars` containing secrets, or private keys. Use encrypted remote state with controlled access for shared environments.

## References

- [Terraform language](https://developer.hashicorp.com/terraform/language)
- [Terraform CLI](https://developer.hashicorp.com/terraform/cli)
- [AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/)
