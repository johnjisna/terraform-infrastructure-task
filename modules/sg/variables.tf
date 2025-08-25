variable "name" {
  description = "Base name for the security groups"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the security groups"
  type        = string
}

variable "alb_ingress_rules" {
  description = "List of ingress rules for ALB SG"
  type = list(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "ec2_ingress_rules" {
  description = "List of ingress rules for EC2 SG"
  type = list(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "db_ingress_rules" {
  description = "List of ingress rules for DB SG"
  type = list(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

