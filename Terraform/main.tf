terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region                   = "us-west-2"
  shared_credentials_files = ["C:\\Users\\chris\\credentials.txt"]
}

resource "aws_instance" "app_server" {
  ami           = "ami-075686beab831bb7f"
  instance_type = "t3.medium"

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft_sg"
  description = "Security group for Minecraft server"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = minecraft_sg
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tcp_ipv4_25565"{
  security_group_id = aws_security_group.minecraft_sg.id
  cidr_ipv4	    = "0.0.0.0/0"
  from_port	    = 25565
  ip_protocol	    = "tcp"
  to_port	    = 25565
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4"{
  security_group_id = aws_security_group.minecraft_sg.id
  cidr_ipv4	    = "0.0.0.0/0"
  from_port	    = 22
  ip_protocol	    = "tcp"
  to_port	    = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_tcp_ipv4_25565"{
  security_group_id = aws_security_group.minecraft_sg.id
  cidr_ipv4	    = "0.0.0.0/0"
  ip_protocol	    = "-1"
}