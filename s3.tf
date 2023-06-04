resource "aws_s3_bucket" "myS3_bucket" {
  bucket = "mys3-bucket-demo-2023"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}