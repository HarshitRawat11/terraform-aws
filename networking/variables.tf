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