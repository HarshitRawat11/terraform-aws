output "vpc_id" {
  value = aws_vpc.custom_vpc.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.rds_subnet_group.*.name
}

# output "db_security_group_ids" {
#   value = [aws_security_group.custom_sg.ingress.rds.id]
# }