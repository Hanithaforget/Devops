provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server1" {
  ami = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
  key_name = "us-east-key"
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow-ssh-"
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
  }
}

