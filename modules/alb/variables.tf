variable "lb_name" {
  description = "Name of the ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "tg_port" {
  type        = number
  description = "Target group port"
}

variable "tg_protocol" {
  type        = string
  description = "Target group protocol"
}

variable "tg_health_check_interval" {
  type        = number
  description = "Health check interval in seconds"
}

variable "tg_health_check_timeout" {
  type        = number
  description = "Health check timeout in seconds"
}

variable "tg_healthy_threshold" {
  type        = number
  description = "Healthy threshold count"
}

variable "tg_unhealthy_threshold" {
  type        = number
  description = "Unhealthy threshold count"
}

variable "target_group_configs" {
  type = map(object({
    health_check_path      = string
    matcher                = string
    listener_priority      = number
    listener_path_patterns = list(string)
  }))
  description = "Map of target group config objects"
}

