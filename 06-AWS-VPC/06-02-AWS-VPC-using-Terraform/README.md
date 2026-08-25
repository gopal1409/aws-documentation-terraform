# VPC Using Terraform

This lab turns the console-built network into repeatable Terraform configuration.

## Expected components

- VPC
- public and private subnets
- route tables and associations
- internet gateway
- NAT gateway when private resources need outbound internet access
- security groups

## Workflow

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

Use variables for CIDR blocks, Availability Zones and environment names. Keep reusable networking logic independent of a personal AWS account.

## Modern security baseline

- Do not expose private application/database tiers directly.
- Keep security-group ingress least-privilege.
- Consider VPC Flow Logs for required network visibility.
- Review NAT gateway cost before creating multiple gateways in a lab.
- Protect Terraform state and do not commit it.

## Cleanup

```bash
terraform plan -destroy
terraform destroy
```

## References

- [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- [AWS VPC Terraform resources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
