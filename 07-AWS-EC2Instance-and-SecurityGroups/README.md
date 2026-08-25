# AWS EC2 Instances and Security Groups

This lesson creates EC2 instances and controls network access with security groups.

## Current EC2 guidance

Prefer Amazon Linux 2023 or another currently supported OS image. For teaching dynamic AMI selection, use AWS Systems Manager public parameters:

```hcl
data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}
```

Then:

```hcl
resource "aws_instance" "web" {
  ami           = data.aws_ssm_parameter.al2023_ami.value
  instance_type = var.instance_type
}
```

## Security groups

Security groups are stateful virtual firewalls. Keep rules narrow and purpose-specific.

Example public web access:

```hcl
ingress {
  description = "HTTPS"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
```

Do not expose SSH to the whole internet for convenience. Prefer Systems Manager Session Manager for administrative access when the architecture supports it.

## Storage

Use encrypted EBS volumes and specify the required volume type/size deliberately. Avoid relying on defaults for production configurations.

## IAM

Attach an instance profile with only the permissions the workload requires. Do not put AWS credentials in user data.

## Validation workflow

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

Verify:

```bash
aws sts get-caller-identity
aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId'
```

Destroy disposable resources after the lab:

```bash
terraform destroy
```

## References

- [Amazon EC2 User Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/)
- [EC2 Terraform resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
- [Security groups](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html)
- [AWS Systems Manager Session Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html)
