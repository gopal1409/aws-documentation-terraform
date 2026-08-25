# Variables and Data Sources — Manifests

This directory contains examples for input variables, AWS data sources and outputs.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Use variable validation for important inputs and prefer AWS public SSM parameters for current AMIs when appropriate. Never commit secrets in `.tfvars` files.