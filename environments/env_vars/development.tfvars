aws_account_id = "748659484642"
#aws_region     = "eu-west-1"
aws_region = "us-east-1"

vpc_cidr = "10.10.0.0/16"

#azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
public_subnets  = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]
