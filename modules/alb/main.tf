resource "aws_lb" "alb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.subnet_ids

  tags = {
    Name = var.lb_name
  }
}

resource "aws_lb_target_group" "group" {
  for_each = var.target_group_configs

  name     = each.key
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id

  health_check {
    path                = each.value.health_check_path
    matcher             = each.value.matcher
    interval            = var.tg_health_check_interval
    timeout             = var.tg_health_check_timeout
    healthy_threshold   = var.tg_healthy_threshold
    unhealthy_threshold = var.tg_unhealthy_threshold
  }

  tags = {
    Name = each.key
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404 Not Found"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "rules" {
  for_each     = var.target_group_configs
  listener_arn = aws_lb_listener.http.arn
  priority     = each.value.listener_priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.group[each.key].arn
  }

  condition {
    path_pattern {
      values = each.value.listener_path_patterns
    }
  }
}

