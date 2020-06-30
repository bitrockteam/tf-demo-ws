# tf-demo - show how to work with workspaces on TF using Makefile

Prerequisite
-Already have installed and configured your AWS CLI.
  Ref:
 
	Linux : https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

	Mac : https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html

- S3 bucket as backend and DynamoDB table with LOCKID.

   Linux or macOS
	$ export AWS_PROFILE=my_profile ; export AWS_REGION=my_region

       Run the script "setup.sh"
        - S3 backend will be created, enabled versioning and encryption.
        - DynamoDB table will be crated with index LOCKID.
          

This repo defines 3 different environments and will create 20 (aws resources) on each one.
To simplify the demo, all these resources are created from this module :     

 terraform-aws-modules/vpc/aws

 This module will create the VPC, subnets, route tables , igw. also is created a S3 bucket for each env...


Update environment/env_vars/<environment.tfvars> and replace your account id, profile and region.

- environment/backend.tf  *Already using the s3 backend name from setup.sh 

With that, you are ready to go, and you could run Makefile.

Run init just one time to create the workspaces and setup Terraform.
$ENV=workspaces make init 

Replace ENV with the name of the workspace that you want to deploy, sample "development".
$ENV=development make plan

Apply the plan created above with terraform apply
$ENV=develpment make apply

To cleanup 

$ENV=development make destroy


Directory structure:

tf-demo/

├── environments

│   ├── backend.tf

│   ├── env_vars

│   │   ├── development.tfvars

│   │   ├── production.tfvars

│   │   └── testing.tfvars

│   ├── Makefile

│   ├── providers.tf

│   ├── s3.tf

│   ├── variables.tf

│   └── vpc.tf

└── README.md


