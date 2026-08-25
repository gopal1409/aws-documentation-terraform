# AWS Classic Load Balancer — Legacy Reference

> **Legacy lesson:** Elastic Load Balancing Classic Load Balancers are an older architecture. For new applications, prefer Application Load Balancer (ALB), Network Load Balancer (NLB), or Gateway Load Balancer according to the traffic pattern.

## Why keep this lesson?

The example is useful for understanding the historical ELB model and for maintaining older environments, but it should not be the default design for new deployments.

## Migration direction

For HTTP/HTTPS applications, the usual modernization path is:

```text
Classic Load Balancer -> Application Load Balancer
```

For TCP/UDP or very high-performance connection-oriented workloads, evaluate NLB instead.

## Terraform workflow

Before applying an old lesson to an account, review the plan and confirm that the AWS provider resource still matches the target environment.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

## Operational guidance

- Use HTTPS/TLS for public traffic.
- Enable access logging and monitoring where required.
- Keep security groups least-privilege.
- Use health checks that represent actual application readiness.
- Prefer modern ALB/NLB lessons in this repository for new infrastructure.

## References

- [Elastic Load Balancing](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/)
- [Application Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
- [Network Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)
- [AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
