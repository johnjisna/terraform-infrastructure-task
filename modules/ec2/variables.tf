variable "ec2_configs" {
  description = "Map of EC2 configuration blocks (public/private)"
  type = map(object({
    image_id            = string
    instance_type       = string
    sg_id               = string
    subnet_ids          = list(string)
    target_group_arns   = list(string)
    desired_capacity    = number
    min_size            = number
    max_size            = number
    user_data           = string
    iam_instance_profile = string
    key_name             = string
    target_value         = number
  }))
}

