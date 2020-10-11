provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_user" "my_iam_users" {
    count = 2
    name = "aws_iam_user.hari_${count.index}"
}