# `templatefile` Function Demo

This small example demonstrates generating text from a Terraform template and a map of values.

## Example pattern

```hcl
locals {
  rendered = templatefile("${path.module}/template.tftpl", {
    app_name = var.app_name
  })
}
```

Use templates for configuration generation, not for distributing long-lived secrets. Keep sensitive values out of templates where possible.

Validate with:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

## Reference

[Terraform `templatefile` function](https://developer.hashicorp.com/terraform/language/functions/templatefile)
