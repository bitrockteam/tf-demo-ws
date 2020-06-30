aws_account_id = "your acccount id"
aws_region     = "your region"
aws_profile    = "your profile"

# azs based on us-west-1 region, if you change region, update them too
vpc_cidr       = "10.60.0.0/16"

azs             = ["us-west-1b", "us-west-1c"]
private_subnets = ["10.60.1.0/24", "10.60.2.0/24"]
public_subnets  = ["10.60.101.0/24", "10.60.102.0/24"]
