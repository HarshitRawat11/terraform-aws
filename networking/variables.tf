# --- networking/variables.tf ---

variable "vpc_cidr" {
  type        = string
  description = "cidr block of the custom vpc"
}

variable "public_cidrs" {
  type        = list(string)
  description = "public subnet cidr blocks"
}

variable "private_cidrs" {
  type        = list(string)
  description = "private subnet cidr blocks"
}

variable "public_sn_count" {
  type        = number
  description = "count of public subnets"
}

variable "private_sn_count" {
  type        = number
  description = "count of private subnets"
}

variable "max_subnet" {
  type        = number
  description = "maximum number of subnets"
}

variable "access_ip" {
  type        = string
  description = "value"
}

variable "security_groups" {
  description = "security groups"
}

variable "db_subnet_group" {
  type        = bool
  description = "rds database subnet group"
}