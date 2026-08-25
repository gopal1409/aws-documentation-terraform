# Terraform Loops, Meta-Arguments and Expressions

This section covers Terraform collection handling and resource expansion.

## `count`

Use `count` when instances are naturally addressed by numeric indexes.

```hcl
resource "aws_s3_bucket" "demo" {
  count  = 2
  bucket = "my-demo-${count.index}"
}
```

## `for_each`

Prefer `for_each` when each instance has a stable key.

```hcl
variable "buckets" {
  type = set(string)
}

resource "aws_s3_bucket" "demo" {
  for_each = var.buckets
  bucket   = each.value
}
```

Using stable keys generally makes changes easier to reason about than index-based addressing.

## `for` expressions

Transform collections:

```hcl
locals {
  upper_names = [for name in var.names : upper(name)]
}
```

Filter collections:

```hcl
locals {
  prod_names = [for name in var.names : name if startswith(name, "prod-")]
}
```

## Splat expressions

Splat syntax is convenient for homogeneous lists of objects:

```hcl
output "instance_ids" {
  value = aws_instance.web[*].id
}
```

For maps created with `for_each`, use a `for` expression instead:

```hcl
output "instance_ids" {
  value = [for instance in aws_instance.web : instance.id]
}
```

## Conditional expressions

```hcl
instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
```

## Modern workflow

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

When changing `count`/`for_each` keys in real infrastructure, inspect the plan carefully because resource addresses may change.

## References

- [Terraform meta-arguments](https://developer.hashicorp.com/terraform/language/meta-arguments)
- [Terraform `for` expressions](https://developer.hashicorp.com/terraform/language/expressions/for)
- [Terraform splat expressions](https://developer.hashicorp.com/terraform/language/expressions/splat)
