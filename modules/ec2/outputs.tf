output "asg_names" {
  description = "Names of the Auto Scaling Groups"
  value = {
    for key, asg in aws_autoscaling_group.ec2_asg : key => asg.name
  }
}

