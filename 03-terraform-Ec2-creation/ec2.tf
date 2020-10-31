provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "AWSServer" {
    ami = "ami-052c08d70def0ac62"
    instance_type = "t2.micro"
    key_name = "devops"
    security_groups = ["launch-wizard-1"]
    tags = {
        Name = "Terraform Server - Hari"
    }
}
