provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "my_s3_devops_bucket" {
    bucket = "my-s3-devops-bucket-harinath-01"
}