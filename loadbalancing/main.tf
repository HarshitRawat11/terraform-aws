# --- loadbalancing/main.tf ---

resource "aws_lb" "custom_lb" {
  name            = "custom-loadbalancer"
  subnets         = var.public_subnets
  security_groups = [var.public_sg]
  idle_timeout    = 400
}