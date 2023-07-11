# --- database/outputs.tf ---

output "db_endpoint" {
  value = aws_db_instance.custom_rds_db.endpoint
}