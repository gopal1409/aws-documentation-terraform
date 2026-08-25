# ALB HTTP Header, Query String and Redirect Rules

This lesson demonstrates advanced Application Load Balancer listener conditions and actions.

## Conditions

ALB rules can evaluate supported request attributes such as:

- host header
- path pattern
- HTTP request method
- HTTP header
- query string
- source IP

Use these rules only when they match a clear application-routing requirement.

## Actions

Common listener actions include:

- forward to a target group
- redirect
- fixed response

A common modernization pattern is HTTP-to-HTTPS redirection:

```text
HTTP :80 -> redirect -> HTTPS :443 -> application
```

## Terraform

The primary resource is `aws_lb_listener_rule` together with `aws_lb_listener`.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Always test both matching and non-matching requests. A rule that is too broad can unexpectedly capture application traffic.

## Security

Do not use headers or query strings as a substitute for authentication or authorization. They are routing inputs, not proof of identity.

For public applications:

- terminate TLS at the ALB
- use AWS WAF when appropriate
- keep backend instances private
- restrict backend security groups to the ALB

## References

- [ALB rule condition types](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/rule-condition-types.html)
- [ALB listener actions](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/listener-update-rules.html)
- [Terraform listener rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule)
