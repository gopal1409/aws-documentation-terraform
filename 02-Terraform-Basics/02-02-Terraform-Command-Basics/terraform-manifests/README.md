# Terraform Command Basics — Manifests

These files are intentionally small examples for practicing Terraform CLI commands.

Run from this directory:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Use `terraform apply` only after reviewing the plan. Destroy disposable lab resources when finished.

Do not commit state, plan files, credentials or private keys.