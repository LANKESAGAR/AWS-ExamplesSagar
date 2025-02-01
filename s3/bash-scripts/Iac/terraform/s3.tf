resource "aws_s3_bucket" "emy-s3-bucket" {
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}