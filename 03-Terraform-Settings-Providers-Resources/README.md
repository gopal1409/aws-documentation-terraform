# Terraform Settings, Providers and Resources

This lesson explains the core Terraform configuration blocks used to connect Terraform to AWS and create infrastructure.

## 1. Terraform settings

Declare required providers and a Terraform CLI constraint. Keep the dependency lock file in Git.

```hcl
terraform {
  required_version = ">= 1.0, < 2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.60"
    }
  }
}
```

Choose and pin the exact Terraform CLI version for your lab/CI environment rather than relying on whatever version happens to be installed.

## 2. AWS provider

Do not hard-code access keys in the provider block. Let the AWS provider use the standard credential chain.

```hcl
provider "aws" {
  region = var.aws_region
}
```

For local work:

```bash
aws sts get-caller-identity
```

Use AWS CLI profiles, IAM roles, IAM Identity Center, or OIDC/web identity as appropriate.

## 3. Resources

A resource describes infrastructure Terraform should manage.

```hcl
resource "aws_instance" "web" {
  ami           = data.aws_ssm_parameter.al2023_ami.value
  instance_type = var.instance_type

  tags = {
    Name = "terraform-web"
  }
}
```

Prefer a current AWS Systems Manager public AMI parameter instead of a copied AMI ID when the lesson is not specifically teaching fixed AMI IDs.

```hcl
data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}
```

## 4. User data

User data is useful for first-boot configuration, but keep scripts idempotent and avoid embedding secrets. For production systems, consider image baking or configuration management when initialization becomes complex.

## 5. Execute the configuration

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

Destroy a disposable lab when finished:

```bash
terraform plan -destroy
terraform destroy
```

## 6. State

`terraform.tfstate` records Terraform's managed state and can contain sensitive values. Do not commit it. Shared environments should use an encrypted, access-controlled remote backend.

## 7. What comes next

The following lessons build on this one:

- input variables and validation
- data sources
- outputs
- `count` and `for_each`
- dependencies
- modules
- networking and load balancing

## Official references

- [Terraform language](https://developer.hashicorp.com/terraform/language)
- [Terraform settings](https://developer.hashicorp.com/terraform/language/block/terraform)
- [AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
- [AWS EC2 resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
- [AWS Systems Manager public parameters](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-public-parameters.html)
