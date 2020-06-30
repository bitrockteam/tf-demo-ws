terraform {
  required_version = "~> 0.12.24"
  backend "s3" {
    bucket         = "workspace-tfstate-eu-west-1"
    key            = ".terraform/terraform.tfstate"
    dynamodb_table = "eu-west-1-tfstate"
    encrypt        = true
    region         = "eu-west-1"
    profile        = "as parameter of Makefile"
  }
}

