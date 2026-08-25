# DNS to Database Architecture with Terraform

This capstone-style lesson connects DNS, load balancing, application infrastructure and a database using Terraform.

## Reference architecture

```text
Route 53
   |
 ALB / HTTPS
   |
Application targets
   |
Private data tier
   |
RDS / database
```

The exact topology in the manifests may differ, but the security principle remains: keep data services private and expose only the required application entry point.

## DNS

Use Route 53 records to point a domain name to the appropriate AWS endpoint. For ALB-backed applications, use an alias record rather than hard-coding a load balancer IP address.

## Database

For production workloads, prefer Amazon RDS or another managed database service when it meets the application requirements. Keep database subnets private and restrict the database security group to the application tier.

Never put database passwords directly in Git. Use Secrets Manager or another appropriate secret-management mechanism and understand whether the selected Terraform resource stores the secret in state.

## Terraform workflow

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

For a destructive lab cleanup:

```bash
terraform plan -destroy
terraform destroy
```

## State and secrets

Terraform state can contain sensitive database attributes and connection information. Protect remote state with encryption and access controls. Mark outputs as sensitive where appropriate, but remember that `sensitive = true` does not prevent values from being stored in state.

## `templatefile`

The `templatefile` demonstration is useful for generating configuration files from Terraform values. Do not use templates to distribute long-lived credentials.

## Production checklist

- Route 53 records and domain ownership verified
- TLS certificate issued through ACM
- ALB security group limited to required ports
- application targets private where possible
- database in private subnets
- database security group accepts only application traffic
- encryption enabled for data at rest
- backups and deletion protection reviewed
- secrets stored outside source control
- remote Terraform state protected
- monitoring and logging enabled

## References

- [Amazon Route 53](https://docs.aws.amazon.com/route53/)
- [Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html)
- [AWS Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html)
- [Terraform `templatefile`](https://developer.hashicorp.com/terraform/language/functions/templatefile)
- [AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
