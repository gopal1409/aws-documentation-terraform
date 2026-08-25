# `count`, `for` Loops, Lists and Maps

Use this lesson to understand Terraform collections and numeric resource expansion.

## Key rules

- `count` creates instances addressed by numeric indexes.
- Lists preserve order.
- Maps provide stable keys.
- `for` expressions transform or filter collections.
- Be careful when changing list ordering because `count` addresses can move.

Example:

```hcl
resource "aws_instance" "web" {
  count         = length(var.instance_names)
  ami           = data.aws_ssm_parameter.al2023_ami.value
  instance_type = var.instance_type

  tags = {
    Name = var.instance_names[count.index]
  }
}
```

Run:

```bash
terraform fmt -recursive
terraform validate
terraform plan
```

For stable named instances, compare this approach with the `for_each` lesson.

## References

- [Terraform `count`](https://developer.hashicorp.com/terraform/language/meta-arguments/count)
- [Terraform `for` expressions](https://developer.hashicorp.com/terraform/language/expressions/for)
