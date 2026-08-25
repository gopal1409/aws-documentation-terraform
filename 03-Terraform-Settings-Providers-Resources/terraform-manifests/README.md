# Settings, Providers and Resources — Manifests

These files demonstrate Terraform settings, the AWS provider and resource blocks.

Use a current Terraform CLI and the HashiCorp AWS provider 6.x. Keep `.terraform.lock.hcl` under version control.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Authentication must come from the AWS credential chain. Do not put access keys in provider configuration.