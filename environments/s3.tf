resource "aws_s3_bucket" "user_data" {
  bucket = "sample-userdata-${terraform.workspace}"
  acl    = "private"
}
