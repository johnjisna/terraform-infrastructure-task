variable "lb_name" {
  description = "Name of the Load Balancer"
  type        = string
}

variable "tg_port" {
  description = "Target group port"
  type        = number
}

variable "tg_protocol" {
  description = "Target group protocol"
  type        = string
}

variable "tg_health_check_interval" {
  description = "Health check interval for the target group"
  type        = number
}

variable "tg_health_check_timeout" {
  description = "Health check timeout for the target group"
  type        = number
}

variable "tg_healthy_threshold" {
  description = "Healthy threshold for the target group"
  type        = number
}

variable "tg_unhealthy_threshold" {
  description = "Unhealthy threshold for the target group"
  type        = number
}

variable "target_group_configs" {
  description = "Configuration for target groups"
  type        = any
}

variable "image_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "scale_min_size" {
  description = "Minimum number of EC2 instances"
  type        = number
}

variable "scale_max_size" {
  description = "Maximum number of EC2 instances"
  type        = number
}

variable "scale_desired_capacity" {
  description = "Desired capacity of the EC2 Auto Scaling Group"
  type        = number
}

variable "scale_target_cpu" {
  description = "Target CPU utilization for autoscaling"
  type        = number
}

variable "name" {
  description = "Common name prefix for resources"
  type        = string
}

variable "username" {
  description = "Master username for RDS"
  type        = string
}

variable "password" {
  description = "Master password for RDS"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name for RDS"
  type        = string
}

variable "engine" {
  description = "Database engine (e.g. postgres)"
  type        = string
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage for RDS in GB"
  type        = number
}

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
}

variable "multi_az" {
  description = "Whether the RDS instance is Multi-AZ"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot before RDS deletion"
  type        = bool
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection for RDS"
  type        = bool
}

variable "backup_retention_period" {
  description = "RDS backup retention period"
  type        = number
}

variable "auto_minor_version_upgrade" {
  description = "Whether to enable automatic minor version upgrades for RDS"
  type        = bool
}

variable "maintenance_window" {
  description = "Maintenance window for RDS"
  type        = string
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "ecr_scan_on_push" {
  description = "Enable scan on push for ECR"
  type        = bool
}

variable "ecr_image_tag_mutability" {
  description = "Image tag mutability for ECR (MUTABLE or IMMUTABLE)"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "secret_name" {
  description = "Name of the secret in Secrets Manager"
  type        = string
}

variable "secret_description" {
  description = "Description of the secret"
  type        = string
}

variable "secret_values" {
  description = "Key-value pairs for secret values"
  type        = map(string)
  sensitive   = true
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "policy_type" {
  description = "Type of bucket policy to apply"
  type        = string
}

variable "custom_domain_name" {
  description = "Custom domain name for CloudFront"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for CloudFront"
  type        = string
}

variable "iam_instance_role_name" {
  description = "IAM role name for EC2 instance profile"
  type        = string
}

variable "trusted_services" {
  description = "List of AWS services that can assume the role"
  type        = list(string)
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
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

