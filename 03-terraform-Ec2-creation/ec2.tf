provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "AWSServer" {
    ami = "ami-0ad289a92ed067259"
    instance_type = "t2.micro"
    key_name = "devops"
    security_groups = ["launch-wizard-1"]
    tags = {
        Name = "Terraform Server - Hari"
    }
}
