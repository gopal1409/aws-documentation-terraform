# `for_each` with Availability Zone and Instance-Type Validation

This lesson combines `for_each` with AWS data sources and Terraform validation logic.

## Design goals

- keep resource keys stable
- validate supported instance types before deployment
- use data sources for AWS facts rather than hard-coded environment assumptions
- keep region and Availability Zone selection configurable

## Workflow

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

If a configuration checks an instance type against a set of supported values, fail during planning rather than discovering the problem after deployment.

For production modules, document which instance families are supported and test the module against the AWS regions in which it will run.

## References

- [Terraform `for_each`](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)
- [Terraform validation](https://developer.hashicorp.com/terraform/language/expressions/custom-conditions)
- [AWS provider data sources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources)
