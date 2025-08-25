resource "aws_launch_template" "ec2_launch_template" {
  for_each = var.ec2_configs

  name_prefix   = "lt-${each.key}-"
  image_id      = each.value.image_id
  instance_type = each.value.instance_type
  vpc_security_group_ids = [each.value.sg_id]
  key_name      = each.value.key_name

  user_data = base64encode(each.value.user_data)

  iam_instance_profile {
    name = each.value.iam_instance_profile
  }
}

resource "aws_autoscaling_group" "ec2_asg" {
  for_each = var.ec2_configs

  desired_capacity    = each.value.desired_capacity
  max_size            = each.value.max_size
  min_size            = each.value.min_size
  vpc_zone_identifier = each.value.subnet_ids
  target_group_arns   = each.value.target_group_arns

  launch_template {
    id      = aws_launch_template.ec2_launch_template[each.key].id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "asg-${each.key}"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "ec2_target_tracking_policy" {
  for_each = var.ec2_configs

  name                   = "target-tracking-${each.key}"
  autoscaling_group_name = aws_autoscaling_group.ec2_asg[each.key].name
  policy_type            = "TargetTrackingScaling"

  lifecycle {
    create_before_destroy = true
  }

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = each.value.target_value

  }
}

