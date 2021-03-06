variable "aws_key_pair" {
    default = "~/aws/aws_keys/devops-hari.pem"
}


provider "aws" {
    region = "us-east-1"
}

resource "aws_default_vpc" "default" {

}

data "aws_subnet_ids" "default_subnets" {
    vpc_id = aws_default_vpc.default.id 
}

data "aws_ami" "aws_linux_2_latest" {
    most_recent = true 
    owners      = ["amazon"]
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*"]
    }

}

data "aws_ami_ids" "aws_linux_2_latest_ids" {
    owners     = ["amazon"]
}

//HTTP server -> SG 
// SG -> 80 TCP, 22 TCP,CIDR Block ["0.0.0.0/0"]

resource "aws_security_group" "http_server_sg" {
    name = "http_server_sg"
    //vpc_id = "vpc-c6478dbb"
    vpc_id = aws_default_vpc.default.id

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
    #ami = "ami-047a51fa27710816e"
    ami      = data.aws_ami.aws_linux_2_latest.id
    key_name = "devops-hari"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.http_server_sg.id]
    subnet_id = "subnet-b0c67cef"

    connection {
        type = "ssh"
        host = self.public_ip
        user = "ec2-user"
        private_key = file (var.aws_key_pair)

    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install httpd -y",//install httpd
            "sudo service httpd start",
            "echo Welcome to web applications -virtual server is at ${self.public_dns} | sudo tee /var/www/index.html"
        ]
    }
}


