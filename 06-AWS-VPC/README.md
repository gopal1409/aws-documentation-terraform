# AWS VPC with Terraform

This section introduces AWS networking and then builds a VPC with Terraform.

## Networking concepts

Understand these components before applying the Terraform lesson:

- VPC and CIDR ranges
- public and private subnets
- Availability Zones
- route tables and routes
- internet gateways
- NAT gateways
- security groups
- network ACLs

## Recommended architecture

For a production-style baseline:

```text
VPC
├── public subnet(s)
│   └── Internet-facing load balancer / NAT gateway
└── private subnet(s)
    └── application and database resources
```

Avoid placing databases directly in public subnets.

## Terraform workflow

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

Use the AWS console lesson to understand the networking objects, then use the Terraform lesson to make the same design repeatable.

## Security

- Keep security groups least-privilege.
- Avoid `0.0.0.0/0` ingress unless it is explicitly required, such as public HTTP/HTTPS on a load balancer.
- Prefer private subnets for application and database tiers.
- Use VPC Flow Logs where monitoring requirements justify them.
- Tag networking resources consistently.

## Cleanup

NAT gateways and other AWS networking resources can incur charges. Destroy disposable labs when finished:

```bash
terraform plan -destroy
terraform destroy
```

## References

- [Amazon VPC documentation](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- [AWS VPC Terraform resources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
- [AWS VPC security best practices](https://docs.aws.amazon.com/vpc/latest/userguide/security.html)
