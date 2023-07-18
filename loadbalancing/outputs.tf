# --- loadbalancing/outputs.tf ---

output "lb_target_group_arn" {
  value = aws_lb_target_group.custom_lb_tg.arn
}

output "lb_endpoint" {
  value = aws_lb.custom_lb.dns_name
}