# ALB Path-Based Routing

Application Load Balancer listener rules can route requests to different target groups based on URL paths.

## Example

```text
example.com/
├── /app1/* -> target group app1
└── /app2/* -> target group app2
```

## Terraform pattern

Use an ALB listener and `aws_lb_listener_rule` resources. Give rules explicit priorities and keep the default action safe.

Typical flow:

```text
VPC -> public subnets -> ALB -> listener -> path rule -> target group -> targets
```

## Rule design

- Put more-specific paths at higher precedence using appropriate priorities.
- Keep a default action for unmatched requests.
- Use health checks for every target group.
- Avoid routing based on untrusted input without considering application security.

## HTTPS

For public services, terminate TLS at the ALB using ACM and an HTTPS listener. Redirect HTTP to HTTPS when appropriate.

## Test

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

Test each path after deployment and confirm the target group receives the expected traffic.

## References

- [ALB listener rules](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/listener-update-rules.html)
- [AWS listener rule resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule)
- [ALB routing](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
