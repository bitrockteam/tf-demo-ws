provider "aws" {
  version                 = "~> 2.53"
  region                  = var.aws_region
  profile                 = var.aws_profile
  shared_credentials_file = "${var.home}.aws/credentials"
}
