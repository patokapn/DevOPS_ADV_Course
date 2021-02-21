provider "aws" {
  region  = "eu-central-1"
}

resource "aws_vpc" "vpc-iac" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_security_group" "web-ssh" {
  name   = "web-ssh"
  description = "Allow HTTP and SSH traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "linux-lb" {
  ami                    = "ami-0502e817a62226e03" # Ubuntu Server 20.04 LTS
  instance_type          = "t2.micro"
  key_name = "AWS"
  vpc_security_group_ids = [aws_security_group.web-ssh.id]

  tags = {
    "Name" = "Loadblancer Ubuntu 20.04LTS"
  }
}

resource "aws_instance" "linux-node1" {
  ami                    = "ami-0502e817a62226e03" # Ubuntu Server 20.04 LTS
  instance_type          = "t2.micro"
  key_name = "AWS"
  vpc_security_group_ids = [aws_security_group.web-ssh.id]
  user_data = file("init-script.sh")

  tags = {
    "Name" = "Node1 Ubuntu 20.04LTS"
  }
}
resource "aws_instance" "linux-node2" {
  ami                    = "ami-0502e817a62226e03" # Ubuntu Server 20.04 LTS
  instance_type          = "t2.micro"
  key_name = "AWS"
  vpc_security_group_ids = [aws_security_group.web-ssh.id]
  user_data = file("init-script.sh")

  tags = {
    "Name" = "Node2 Ubuntu 20.04LTS"
  }
}