# VPC Terraform Manifests

This directory contains the Terraform implementation of the VPC design.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Review CIDRs, routes, NAT gateway count and security-group ingress before applying. NAT gateways can create AWS charges, so destroy disposable labs when finished.