terraform {
  backend "s3" {
    bucket  = "tf-statefiles-eu-west-1"
    key     = "terraform/terraform.tfstate"
    region  = "eu-west-1"
    profile = "victor-test"
  }
}

