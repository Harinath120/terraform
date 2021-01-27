provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_user" "my_iam_users" {
    count = 2
    name = "my_iam_awsdevops_${count.index}"
}
