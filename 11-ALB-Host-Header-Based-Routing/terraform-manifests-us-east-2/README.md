# Host Routing — us-east-2 Manifests

Regional example for the host-header ALB lesson.

Treat the AWS region as configuration and verify that all referenced resources exist in the selected region before planning.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```