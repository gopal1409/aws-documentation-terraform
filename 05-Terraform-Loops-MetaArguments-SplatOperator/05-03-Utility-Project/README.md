# Terraform Utility Project

This project combines Terraform expressions, locals, variables and collection transformations into a reusable configuration pattern.

## Modern practices

- Keep reusable values in `locals` and variables.
- Prefer stable `for_each` keys for named resources.
- Validate variables at module boundaries.
- Avoid hidden dependencies and hard-coded AWS account-specific identifiers.
- Run formatting and validation before every plan.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Keep secrets out of variables files committed to Git. Use the AWS credential chain and a protected state backend.

## References

- [Terraform expressions](https://developer.hashicorp.com/terraform/language/expressions)
- [Terraform locals](https://developer.hashicorp.com/terraform/language/values/locals)
- [Terraform variables](https://developer.hashicorp.com/terraform/language/values/variables)
