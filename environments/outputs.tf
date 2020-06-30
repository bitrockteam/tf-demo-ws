#Output variable definitions

output "vpc_name" {
  description = "Name of the VPC"
  value       = module.vpc.name
}

output "vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets
}

output "s3_userdata" {
  description = "Name of S3 userdata "
  value       = aws_s3_bucket.user_data
}
