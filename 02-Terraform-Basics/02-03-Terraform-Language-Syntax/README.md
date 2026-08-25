# Terraform Language Syntax

Terraform configuration uses HashiCorp Configuration Language (HCL). The most important blocks are:

- `terraform` — CLI and provider requirements
- `provider` — provider configuration
- `resource` — infrastructure managed by Terraform
- `data` — information read from existing infrastructure
- `variable` — module inputs
- `locals` — reusable expressions
- `output` — values exposed after evaluation
- `module` — reusable Terraform configuration

## Example

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.60"
    }
  }
}

variable "name" {
  type = string
}

locals {
  common_tags = {
    Project = var.name
  }
}
```

## Expressions

Terraform supports strings, numbers, booleans, lists, sets, maps, objects, conditionals, functions and `for` expressions.

Prefer explicit types for reusable module inputs and add validation where invalid values would create unsafe infrastructure.

## Formatting and validation

```bash
terraform fmt -recursive
terraform fmt -check -recursive
terraform validate
```

## Security

HCL is configuration, not a secret store. Do not embed passwords, access keys, private keys or tokens in examples. Use variables only as interfaces to secret-management workflows, and protect state.

## References

- [Terraform language](https://developer.hashicorp.com/terraform/language)
- [Terraform configuration syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration)
- [Terraform expressions](https://developer.hashicorp.com/terraform/language/expressions)
