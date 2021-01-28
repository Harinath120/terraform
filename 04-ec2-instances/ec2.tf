provider "aws" {
    region = "us-east-1"
}

//HTTP server -> SG 
// SG -> 80 TCP, 22 TCP,CIDR Block ["0.0.0.0/0"]

resource "aws_security_group" "http_server_sg" {
    name = "http_server_sg"
    vpc_id = "vpc-c6478dbb"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags =  {
        name = "http_server_sg"
    }


}

resource "aws_instance" "http_server" {
    ami = "ami-047a51fa27710816e"
    key_name = "devops-hari"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.http_server_sg.id]
    subnet_id = "subnet-b0c67cef"
}