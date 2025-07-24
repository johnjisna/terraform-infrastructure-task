output "iam_policies" {
  description = "IAM policies created"
  value       = keys(aws_iam_policy.policies)
}

output "iam_instance_profile_name" {
  value       = aws_iam_instance_profile.ec2_profile[0].name
  description = "The name of the EC2 instance profile"
}

