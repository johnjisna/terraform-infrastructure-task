output "target_group_arn_public" {
  value = aws_lb_target_group.group["tg-public"].arn
}

output "target_group_arn_private" {
  value = aws_lb_target_group.group["tg-private"].arn
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}
