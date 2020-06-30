variable "home" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "aws_profile" {
  type        = string
  description = "Your AWS profile"
}

variable "aws_region" {
  type        = string
  default     = "eu-west-1"
  description = "Your AWS region"
}

variable "vpc_cidr" {
  type        = string
  description = "Your VPC CIDR"
}

variable "azs" {
  type        = list
  description = "Your AWS AZ"
}

variable "private_subnets" {
  type        = list
  description = "Your private subnet"
}

variable "public_subnets" {
  type        = list
  description = "Your public subnet"
}

