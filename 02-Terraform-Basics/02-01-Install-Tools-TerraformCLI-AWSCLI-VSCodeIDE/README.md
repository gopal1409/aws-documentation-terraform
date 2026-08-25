# Terraform, AWS CLI & VS Code Installation

This guide uses current installation methods and secure AWS authentication practices.

## Step-01: Install the required tools

- Terraform CLI
- AWS CLI v2
- Visual Studio Code
- HashiCorp Terraform extension for VS Code

Verify the installations:

```bash
terraform version
aws --version
code --version
```

## Step-02: Install Terraform

Use the official HashiCorp installation documentation for your operating system:

- [Terraform installation](https://developer.hashicorp.com/terraform/install)
- [Terraform CLI documentation](https://developer.hashicorp.com/terraform/cli)

After installation:

```bash
terraform version
terraform -help
```

> For reproducible labs and CI/CD, pin the Terraform version used by the project. Do not depend on an old tutorial version.

## Step-03: Install Visual Studio Code

- [Visual Studio Code](https://code.visualstudio.com/download)
- [HashiCorp Terraform extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

Recommended workflow:

```bash
terraform fmt -recursive
terraform validate
```

## Step-04: Install AWS CLI v2

Use the official AWS CLI v2 installation instructions:

- [AWS CLI v2 Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

Verify the installation:

```bash
aws --version
```

## Step-05: Configure AWS authentication securely

Create or use an AWS identity with only the permissions required for the lab. Prefer short-lived credentials, IAM Identity Center, workload identity, or IAM roles over long-lived access keys.

For a local named profile:

```bash
aws configure --profile terraform-lab
```

Verify the identity before running Terraform:

```bash
aws sts get-caller-identity --profile terraform-lab
```

For the default profile:

```bash
aws sts get-caller-identity
```

### Important security rules

- Never commit AWS access keys or secret access keys.
- Never place real credentials in `.tf`, `.tfvars`, Markdown, or shell scripts.
- Never copy a real secret into a public Git repository.
- Treat Terraform state as sensitive because it can contain resource attributes and secrets.
- Rotate credentials immediately if they are accidentally exposed.

## Step-06: Use an AWS profile with Terraform

Linux/macOS:

```bash
export AWS_PROFILE=terraform-lab
aws sts get-caller-identity
terraform plan
```

Windows PowerShell:

```powershell
$env:AWS_PROFILE="terraform-lab"
aws sts get-caller-identity
terraform plan
```

For teaching profile selection explicitly, the AWS provider can also use a profile:

```hcl
provider "aws" {
  region  = var.aws_region
  profile = "terraform-lab"
}
```

For reusable modules and CI/CD, prefer the standard AWS credential chain, environment variables, workload identity/OIDC, or IAM roles rather than hard-coding a personal profile.

## Step-07: Initialize and validate Terraform

From the directory containing the Terraform configuration:

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

Deploy:

```bash
terraform apply
```

Destroy lab resources when finished:

```bash
terraform destroy
```

## Step-08: Windows PATH troubleshooting

If `terraform` is not recognized on Windows:

1. Confirm where `terraform.exe` is installed.
2. Add that directory to the user or system `PATH`.
3. Close and reopen PowerShell or Command Prompt.
4. Verify:

```powershell
terraform version
```

## Step-09: Linux/macOS troubleshooting

Check executable discovery:

```bash
which terraform
which aws
terraform version
aws --version
```

Check the AWS identity:

```bash
aws sts get-caller-identity
```

Validate Terraform code:

```bash
terraform fmt -check -recursive
terraform validate
```

## Step-10: Official references

- [Terraform installation](https://developer.hashicorp.com/terraform/install)
- [Terraform CLI](https://developer.hashicorp.com/terraform/cli)
- [Terraform AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
- [AWS CLI v2 installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [AWS CLI configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
- [AWS IAM best practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
