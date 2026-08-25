# DNS to Database Manifests

These files implement the capstone architecture connecting DNS, load balancing, application infrastructure and a managed database.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Keep databases private, restrict database security groups to the application tier, protect Terraform state and keep secrets out of source control.