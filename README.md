# tf-demo

Prerequisite
-Already have installed and configured your AWS CLI.
  Ref: 
	Linux : https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
	Mac : https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html

- S3 bucket as backend
   Linux or macOS
	$ export AWS_PROFILE=my_profile

	Create the bucket with AWS CLI:
	aws s3 mb s3://tf-statefiles-${TF_RG} --region ${TF_RG} --profile my-profile

	Enable versioning:
	aws s3api put-bucket-versioning --bucket tf-statefiles-${TF_RG} --versioning-configuration Status=Enabled

This repo defines 3 different environments and will create 20 (aws resources) on each one.
To simplify the demo, all these resources are created from this module :     

 terraform-aws-modules/vpc/aws
 This module will create the VPC, subnets, S3, route tables , igw. Etc for each env...


Update backend.tf and replace your bucket name = "tf-statefiles-your-region", your region , your key and your profile.

terraform {
  backend "s3" {
    bucket  = "tf-statefiles-eu-west-1"
    key= "terraform/terraform.tfstate"  (This is the default key)
    region  = "eu-west-1"
    profile = "my-profile"
  }
}




# tf-demo
# tf-demo