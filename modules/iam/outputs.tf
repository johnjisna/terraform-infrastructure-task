output "iam_policies" {
  description = "IAM policies created"
  value       = keys(aws_iam_policy.policies)
}

output "instance_profile_name" {
  value = length(aws_iam_instance_profile.ec2_profile) > 0 ? aws_iam_instance_profile.ec2_profile[0].name : null
  description = "The name of the EC2 instance profile"
}

