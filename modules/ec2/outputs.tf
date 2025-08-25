output "asg_names" {
  description = "Names of the Auto Scaling Groups"
  value = {
    for key, asg in aws_autoscaling_group.ec2_asg : key => asg.name
  }
}

output "instance_ids" {
  description = "List of EC2 instance IDs by ASG"
  value = {
    for key, asg in aws_autoscaling_group.ec2_asg :
    key => aws_autoscaling_group.ec2_asg[key].id
  }
}

output "launch_template_ids" {
  description = "Launch template IDs"
  value = {
    for key, lt in aws_launch_template.ec2_launch_template :
    key => lt.id
  }
}

output "asg_arns" {
  value = {
    for key, asg in aws_autoscaling_group.ec2_asg : key => asg.arn
  }
}

