# ALB Host Routing Manifests

These files demonstrate hostname-based listener rules.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Keep the backend targets private where possible and use ACM certificates with HTTPS for public hostnames.