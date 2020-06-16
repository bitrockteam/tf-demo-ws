provider "aws" {
  version                 = "~> 2.53"
  region                  = var.aws_region
  profile                 = "victor-test"
  shared_credentials_file = "${var.home}.aws/credentials"

}
