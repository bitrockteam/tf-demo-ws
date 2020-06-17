resource "aws_s3_bucket" "user_data" {
  count  = 1
  bucket = "sample-userdata-${terraform.workspace}"
  acl    = "private"
}
