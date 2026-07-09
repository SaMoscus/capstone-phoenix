# Terraform

This directory provisions the AWS infrastructure for the k3s cluster:

- VPC, internet gateway, route table, and public subnets
- Security group with `80/443` public, `22/6443` restricted to `admin_cidr`, and internal node traffic
- One control-plane EC2 instance
- Two or more worker EC2 instances
- Outputs for Ansible inventory

Before running, edit `versions.tf` with your real S3 backend bucket and DynamoDB lock table. Then copy `terraform.tfvars.example` to `terraform.tfvars` and fill in your `admin_cidr`, Ubuntu AMI, and SSH key pair.

```bash
terraform init
terraform plan
terraform apply
terraform output -raw ansible_inventory > ../ansible/inventory.ini
```

Do not commit `terraform.tfvars`, plans, or state files.

