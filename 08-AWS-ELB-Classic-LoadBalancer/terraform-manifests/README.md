# Classic Load Balancer Manifests

This is a legacy ELB example retained for learning and maintenance.

For new HTTP/HTTPS systems, use the ALB lessons in this repository. For TCP/UDP workloads, evaluate NLB.

Validate before using legacy configuration:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```