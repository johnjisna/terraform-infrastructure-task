Terraform Infrastructure - README

This project provisions and manages cloud infrastructure using Terraform. It uses a modular approach, with reusable components defined under the modules/ directory and environment-specific configurations in envs/.
Project Structure

terraform-infra/
├── envs/
│   └── dev/
│       ├── backend.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── provider.tf
│       ├── terraform.tfvars
│       └── variables.tf
├── modules/
│   ├── alb/
│   ├── cdn/
│   ├── ec2/
│   ├── ecr/
│   ├── iam/
│   ├── rds/
│   ├── s3/
│   ├── secrets/
│   ├── sg/
│   └── vpc/

Getting Started
---------------
Prerequisites:

    Terraform installed

    AWS CLI configured (aws configure)

    Proper IAM permissions for managing infrastructure

 Environment Setup (e.g., dev)

Navigate to your environment directory:

cd terraform-infra/envs/dev

 Terraform Workflow
1. Initialize

terraform init

    Downloads required providers

    Configures the backend (from backend.tf)

2. Validate Configuration (Optional)

terraform validate

    Checks for syntax or configuration errors

3. Preview Changes

terraform plan -var-file="terraform.tfvars"

    Shows the resources that will be created/modified/destroyed

4. Apply Changes

terraform apply -var-file="terraform.tfvars"

    Provisions/updates infrastructure

5. Update Infrastructure

Make changes to .tf files or variables and re-run:

terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"

6. Destroy Infrastructure

terraform destroy -var-file="terraform.tfvars"

    Destroys all resources defined in the current workspace

Modules Overview

Each module under modules/ encapsulates a specific AWS resource or service.
Module	Description
vpc/	Creates VPC, subnets, routes
sg/	Security Groups
ec2/	EC2 Instances
alb/	Application Load Balancer
ecr/	Elastic Container Registry
cdn/	CloudFront Distribution
s3/	S3 Buckets
rds/	RDS Instances
secrets/	Secrets Manager secrets
iam/	IAM roles/policies

Each module typically contains:

    main.tf – resource definitions

    variables.tf – inputs

    outputs.tf – outputs

Inputs & Outputs
Inputs

Defined in variables.tf. Example:

variable "project_name" {
  description = "Name of the project"
  type        = string
}

Provided via terraform.tfvars or CLI:

terraform apply -var 'project_name=myapp'

Outputs

Defined in outputs.tf. Example:

output "vpc_id" {
  value = module.vpc.vpc_id
}

Shown after apply and accessible via:

terraform output

 Notes

    Remote state configuration is defined in backend.tf

    Make sure to version lock providers in .terraform.lock.hcl

    Use terraform fmt to format code consistently

Security

    Store secrets using secrets/ module or AWS Secrets Manager

    Use encrypted state backend (e.g., S3 + DynamoDB for locking)



