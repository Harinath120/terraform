provider "aws" {
    region = "us-east-1"
}

# plan -execute

resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-hari-terraform"
}