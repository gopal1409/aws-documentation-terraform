# Infrastructure as Code (IaC) Basics

Infrastructure as Code means defining infrastructure in version-controlled, repeatable configuration instead of creating every resource manually.

## Why IaC?

- Repeatable environments
- Reviewable infrastructure changes
- Automated provisioning
- Consistent configuration
- Easier disaster recovery
- Audit history through Git

## Terraform workflow

```text
Write -> fmt -> init -> validate -> plan -> apply -> verify -> destroy
```

Typical commands:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

Always inspect the plan before applying changes in shared or production environments.

## Desired state and current state

Terraform compares the configuration (desired state) with the state it has recorded and the provider's view of real infrastructure. Terraform then proposes the smallest set of changes needed to converge on the desired state.

## AWS authentication

Do not put access keys in `.tf` files. Use the AWS SDK credential chain, AWS CLI profiles, IAM roles, IAM Identity Center, or OIDC/web identity as appropriate.

Verify the identity before a lab:

```bash
aws sts get-caller-identity
```

## State

Terraform state is important and may contain sensitive infrastructure information. For team environments, use an encrypted, access-controlled remote backend with locking appropriate to the backend. Never commit local state or plan files to Git.

## Modern IaC practices

- Pin Terraform and provider versions for reproducibility.
- Keep modules small and purpose-specific.
- Use variables instead of hard-coded environment values.
- Prefer data sources or AWS Systems Manager public parameters over stale AMI IDs.
- Tag AWS resources consistently.
- Use least-privilege IAM permissions.
- Run formatting, validation, security scanning, and plan checks in CI.

## Official references

- [Terraform language](https://developer.hashicorp.com/terraform/language)
- [Terraform CLI](https://developer.hashicorp.com/terraform/cli)
- [AWS Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html)
- [AWS IAM best practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [Terraform AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
