# EC2 and Security Group Manifests

These manifests implement the EC2/security-group lesson.

Prefer current AMIs through AWS Systems Manager public parameters, encrypted EBS volumes, least-privilege security groups and IAM roles instead of embedded credentials.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Use Session Manager where practical instead of opening SSH to the internet.