variable "lb_name" {
  type = string
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of Availability Zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "name" {
  description = "Prefix for RDS resource names"
  type        = string
}

variable "username" {
  description = "RDS master username"
  type        = string
}

variable "password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "engine" {
  description = "Database engine (e.g., postgres)"
  type        = string
}

variable "engine_version" {
  description = "Engine version (e.g., 15.4)"
  type        = string
}

variable "instance_class" {
  description = "Instance class (e.g., db.t3.micro)"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "publicly_accessible" {
  description = "Whether the RDS instance should be publicly accessible"
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot before deletion"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "auto_minor_version_upgrade" {
  description = "Allow automatic minor version upgrades"
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "Preferred maintenance window"
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "ecr_scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository"
  type        = bool
  default     = true
}

variable "ecr_image_tag_mutability" {
  description = "The tag mutability setting for the repository (MUTABLE or IMMUTABLE)"
  type        = string
  default     = "MUTABLE"
}

variable "environment" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
}

variable "project" {
  description = "The project name"
  type        = string
}

variable "secret_name" {
  description = "Name of the secret"
  type        = string
}

variable "secret_description" {
  description = "Description of the secret"
  type        = string
}

variable "secret_values" {
  description = "Key-value pairs to store in the secret"
  type        = map(string)
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate for the custom domain"
  type        = string
  default     = null
}

variable "custom_domain_name" {
  description = "The custom domain name for the CloudFront distribution"
  type        = string
  default     = ""
}

variable "policy_type" {
  description = "access type wheather its a cloudfront or iam user"
  type        = string
  default     = "null"
}

variable "bucket_name" {
  description = "bucket name"
  type        = string
  default     = "null"
}


variable "trusted_services" {
  description = "List of AWS services that can assume this IAM role"
  type        = list(string)
}

variable "iam_instance_role_name" {
  description = "Name of the IAM role to attach to the EC2 instance profile"
  type        = string
}


