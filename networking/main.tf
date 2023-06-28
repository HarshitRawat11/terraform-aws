resource "random_integer" "random" {
  min = 1
  max = 10
}

resource "aws_vpc" "custom_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "custom-vpc-${random_integer.random.id}"
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_cidrs)
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"][count.index]

  tags = {
    Name = "custom-public-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count                   = length(var.public_cidrs)
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = var.private_cidrs[count.index]
  map_public_ip_on_launch = false
  availability_zone       = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"][count.index]

  tags = {
    Name = "custom-private-${count.index + 1}"
  }
}