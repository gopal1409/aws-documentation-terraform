# ALB Host-Header-Based Routing

Application Load Balancer listener rules can route requests based on the HTTP `Host` header.

## Example

```text
app.example.com -> application target group
api.example.com -> API target group
```

## Terraform building blocks

Use:

- `aws_lb`
- `aws_lb_listener`
- `aws_lb_listener_rule`
- `aws_lb_target_group`
- `aws_lb_target_group_attachment`

A host-header condition should be explicit and should map to a known target group.

## HTTPS and certificates

For production traffic, use an HTTPS listener and ACM certificates. If multiple hostnames are served, use an ACM certificate that covers the required names and configure the appropriate listener certificate behavior.

## Validation

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

Test each hostname and verify the correct target group receives traffic.

## Multi-region note

The `terraform-manifests-us-east-2` directory is a regional example. Treat region as configuration rather than embedding a region in reusable module logic.

## Security

- Do not trust arbitrary host headers in application logic.
- Use TLS for public traffic.
- Keep backend targets private where possible.
- Restrict backend security groups to traffic from the ALB.

## References

- [ALB host-based routing](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/rule-condition-types.html)
- [Terraform listener rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule)
- [AWS Certificate Manager](https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html)
