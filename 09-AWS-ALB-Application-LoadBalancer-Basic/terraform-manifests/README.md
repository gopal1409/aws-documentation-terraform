# Basic ALB Manifests

These files implement an Application Load Balancer, listener, target group and supporting network configuration.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Use HTTPS/ACM for public production traffic and restrict backend security groups to the ALB security group.