# AWS Application Load Balancer (ALB) — Basic

An Application Load Balancer operates at Layer 7 and is designed for HTTP/HTTPS applications.

## Core components

```text
Internet
   |
 ALB
   |
Target Group
   |
EC2 / ECS / IP targets
```

The ALB uses listeners and listener rules to route traffic to target groups.

## Terraform concepts

Typical resources include:

- `aws_lb`
- `aws_lb_listener`
- `aws_lb_target_group`
- `aws_lb_target_group_attachment`
- `aws_security_group`

Keep the ALB and application security groups separate so the application tier can accept traffic only from the load balancer security group.

## HTTPS

For production-style deployments, use an ACM certificate and an HTTPS listener. Redirect HTTP to HTTPS where appropriate.

## Health checks

Configure health checks against an application endpoint that represents readiness, not merely whether the process is running.

## Validation

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

Review the plan carefully before modifying an existing load balancer.

## Security

- Restrict target security groups to ALB security-group traffic.
- Avoid exposing application instances directly to the internet.
- Use TLS for public application traffic.
- Enable access logging and monitoring where required.
- Use WAF when the application threat model requires it.

## References

- [Application Load Balancer documentation](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
- [AWS ALB Terraform resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb)
- [ALB listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener)
- [AWS Certificate Manager](https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html)
