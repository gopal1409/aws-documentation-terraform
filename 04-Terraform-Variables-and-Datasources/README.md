# Terraform Variables and Data Sources

Use variables to parameterize reusable configurations and data sources to query information that already exists in AWS.

## Input variables

```hcl
variable "aws_region" {
  description = "AWS region for the deployment"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
```

For production, validate important inputs and keep environment-specific values outside the module source.

```hcl
variable "environment" {
  type = string

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "environment must be dev, stage, or prod."
  }
}
```

## Variable precedence

Terraform can receive values from defaults, auto-loaded variable files, explicitly supplied variable files, environment variables, and command-line `-var` / `-var-file` arguments. Avoid committing files containing secrets.

Use `terraform.tfvars.example` as a safe template and keep real `terraform.tfvars` ignored.

## Data sources

Data sources read information from AWS without creating it.

For EC2 AMIs, prefer a current AWS public SSM parameter where appropriate:

```hcl
data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}
```

Then:

```hcl
ami = data.aws_ssm_parameter.al2023_ami.value
```

This avoids teaching with an AMI ID that may become obsolete.

## Outputs

Outputs expose useful values after apply:

```hcl
output "instance_id" {
  value = aws_instance.web.id
}
```

Use `sensitive = true` for outputs that contain sensitive values. Remember that sensitive does not remove the value from state.

## Workflow

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy
```

## Security

Do not use input variables as a reason to place credentials in source control. Prefer IAM roles, AWS CLI profiles, IAM Identity Center, OIDC, or a secrets manager for credentials and secrets.

## References

- [Terraform input variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [Terraform data sources](https://developer.hashicorp.com/terraform/language/data-sources)
- [Terraform outputs](https://developer.hashicorp.com/terraform/language/values/outputs)
- [AWS SSM public parameters](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-public-parameters.html)
