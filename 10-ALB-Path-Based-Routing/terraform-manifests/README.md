# ALB Path Routing Manifests

These files implement listener rules that route URL paths to different target groups.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Use explicit rule priorities and test both matching and default traffic paths.