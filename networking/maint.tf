resource "random_integer" "random" {
  min = 1
  max = 10
}

resource "aws_vpc" "custom_vpc" {
  cidr_block = var.vpc_cidr
}