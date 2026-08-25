# Utility Project — Manifests

Terraform configuration for the utility project lives here.

Validate before deployment:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Use the AWS credential chain and keep state/credentials out of Git.