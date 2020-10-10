provider "aws" {
    region = "us-east-1"
}

# plan -execute

resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-hari-terraform-001"
    versioning {
        enabled = true
    }
}

resource "aws_iam_user" "my_iam_user" {
    name = "aws_iam_user.hari"
}

output "my_s3_bucket_versioning" {
    value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}

output "my_iam_user_complete_details" {
    value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}
