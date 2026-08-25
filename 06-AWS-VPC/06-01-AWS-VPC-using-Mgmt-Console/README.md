# VPC Using the AWS Management Console

This lab teaches VPC networking visually before reproducing the same architecture with Terraform.

## Build and verify

Create the VPC, subnets, route tables, gateway associations and security controls through the AWS console. Record the CIDR ranges and Availability Zones you select because they become Terraform inputs in the next lesson.

## Modern guidance

- Use private subnets for application and database workloads.
- Use public subnets only for resources that genuinely need public ingress/egress.
- Avoid broad security-group ingress rules.
- Plan CIDR ranges so they do not overlap with connected networks.
- Tag resources consistently.

After completing the console exercise, repeat the design in `06-02-AWS-VPC-using-Terraform` so the infrastructure becomes repeatable and reviewable.

## References

- [Amazon VPC User Guide](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- [VPC security](https://docs.aws.amazon.com/vpc/latest/userguide/security.html)
