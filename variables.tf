variable "ACCESS_KEY" {
  type        = string
  description = "access key of iam user"
}

variable "SECRET_KEY" {
  type        = string
  description = "secret key of iam user"
}

variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "aws region"
}

variable "access_ip" {
  type        = string
  description = "list of ip address allowed for ingress rule in public security group"
}

variable "dbname" {
  type        = string
  description = "name of the db"
}

variable "dbuser" {
  type        = string
  description = "name of the user of the db"
  sensitive   = true
}

variable "dbpassword" {
  type        = string
  description = "password of the db"
  sensitive   = true

}