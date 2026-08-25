# AWS + Terraform Documentation and Labs

A hands-on reference repository for learning Infrastructure as Code with Terraform on AWS.

## What this repository covers

The lessons progress from IaC fundamentals to reusable Terraform patterns and AWS infrastructure:

1. Infrastructure as Code fundamentals
2. Terraform installation and CLI basics
3. Terraform language and configuration syntax
4. Providers, resources, variables, data sources, and outputs
5. Loops and meta-arguments such as `count`, `for_each`, `for`, and splat expressions
6. EC2 and supporting AWS infrastructure
7. Advanced Terraform patterns used in practical environments

## Current baseline

The examples are intended for modern Terraform and the HashiCorp AWS provider 6.x. Pin provider versions in learning projects and run `terraform init`, `terraform fmt`, and `terraform validate` before applying changes.

The AWS provider supports the standard AWS credential chain, including environment variables, shared configuration/credentials files, IAM roles, and OIDC/web identity. Avoid hard-coded access keys in Terraform source. citeturn767625search2

## Safe lab workflow

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
terraform destroy
```

Before any deployment, verify the AWS identity:

```bash
aws sts get-caller-identity
```

Use a dedicated AWS account or lab environment whenever possible, and grant only the permissions needed for the exercise.

## Security rules

- Never commit AWS access keys, secret keys, session tokens, private keys, or passwords.
- Keep `terraform.tfstate` and plan files out of Git unless you have deliberately designed a secure workflow for them.
- Prefer IAM roles, IAM Identity Center, OIDC, or other short-lived credentials over long-lived access keys.
- Use encrypted and access-controlled remote state for shared environments.
- Mark sensitive Terraform outputs as `sensitive = true` and use AWS Secrets Manager for secrets that should not be embedded in configuration.

AWS recommends least privilege, IAM roles, protected remote state, Secrets Manager, and continuous scanning as part of secure Terraform usage. citeturn767625search4

## EC2 examples

Where the lesson needs an AMI, prefer AWS Systems Manager public parameters rather than hard-coding an old AMI ID. AWS maintains public parameters for current Amazon Linux images, including Amazon Linux 2023. citeturn767625search11turn767625search5

Example pattern:

```hcl
data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}
```

For production-like access to EC2, prefer Systems Manager Session Manager rather than exposing SSH to the public internet. AWS notes that managed instances do not need public IP addresses to communicate with Systems Manager. citeturn767625search9

## Recommended project structure

Each lab should keep documentation close to the configuration it explains:

```text
lesson/
├── README.md
└── terraform-manifests/
    ├── versions.tf
    ├── variables.tf
    ├── data.tf
    ├── main.tf
    ├── outputs.tf
    └── terraform.tfvars.example
```

## Official references

- [Terraform CLI documentation](https://developer.hashicorp.com/terraform/cli)
- [Terraform language documentation](https://developer.hashicorp.com/terraform/language)
- [HashiCorp AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
- [AWS CLI documentation](https://docs.aws.amazon.com/cli/latest/userguide/)
- [AWS Terraform security best practices](https://docs.aws.amazon.com/prescriptive-guidance/latest/terraform-aws-provider-best-practices/security.html)
- [Amazon Linux 2023 on EC2](https://docs.aws.amazon.com/linux/al2023/ug/ec2.html)
- [AWS Systems Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/)

> Version note: The AWS provider registry currently lists 6.60.0 as the latest release at the time this repository was refreshed. citeturn767625search2
