# --- compute/outputs.tf ---

output "instances" {
  value     = aws_instance.custom_node[*]
  sensitive = true
}

output "tg_port" {
  value = aws_lb_target_group_attachment.tg_attach[0].port
}