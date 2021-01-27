provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-bucket-awsdevops01"
    versioning {
        enabled = true 
    }
}

output "my_s3_bucket_versioning" {
    value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled 
}