# Terraform CLI Command Basics

Terraform's core workflow is:

```text
init -> fmt -> validate -> plan -> apply -> verify -> destroy
```

## Essential commands

```bash
terraform version
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
terraform show
terraform output
terraform destroy
```

### Inspect before changing infrastructure

```bash
terraform plan
terraform plan -out=tfplan
terraform show tfplan
```

Treat saved plan files as sensitive artifacts and do not commit them to Git.

### Refresh and state

Modern Terraform automatically reconciles state as part of planning/applying. Use state commands deliberately:

```bash
terraform state list
terraform state show <address>
```

Do not edit state JSON manually. Use supported state commands or migration workflows.

## Initialization

`terraform init` downloads providers/modules and initializes the backend. Re-run it after changing provider/module/backend configuration.

Keep `.terraform.lock.hcl` in source control.

## Validation

```bash
terraform fmt -check -recursive
terraform validate
```

Add security/static analysis in CI for shared repositories.

## Cleanup

```bash
terraform plan -destroy
terraform destroy
```

## References

- [Terraform CLI](https://developer.hashicorp.com/terraform/cli)
- [Terraform command reference](https://developer.hashicorp.com/terraform/cli/commands)
