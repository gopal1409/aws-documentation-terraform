# `for_each` Meta-Argument

Use `for_each` when resources have meaningful, stable keys.

```hcl
variable "instances" {
  type = map(object({
    instance_type = string
  }))
}

resource "aws_instance" "web" {
  for_each      = var.instances
  ami           = data.aws_ssm_parameter.al2023_ami.value
  instance_type = each.value.instance_type

  tags = {
    Name = each.key
  }
}
```

## Why use it?

`for_each` produces resource addresses such as `aws_instance.web["app1"]`, which can be easier to manage than numeric indexes when individual instances have names or roles.

Do not use an unknown value or a collection that changes unpredictably as the `for_each` key set. Keys need to be known during planning.

## Validate

```bash
terraform fmt -recursive
terraform validate
terraform plan
```

Review address changes carefully before applying modifications to existing infrastructure.

## Reference

[Terraform `for_each`](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)
