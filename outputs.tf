# --- root/outputs.tf ---

output "load_balancer_endpoint" {
  value = module.loadbalancing.lb_endpoint
}

output "instance" {
  value     = { for i in module.compute.instances : i.tags.Name => "${i.public_ip} : ${module.compute.tg_port}" }
  sensitive = true
}

output "kubeconfig" {
  value     = [for i in module.compute.instances : "export KUBECONFIG=../k3s-${i.tags.Name}.yaml"]
  sensitive = true
}