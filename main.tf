terraform {
  backend "remote" {
    organization = "zemur"
    workspaces {
      name = "Example-Workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

resource "aws_instance" "app_server" {
  ami           	= var.ami_id
  instance_type 	= var.instance_type
  security_groups	= [aws_security_group.app_server_sg.name]

  tags = {
    Name 		= var.instance_name
  }
}

resource "aws_security_group" "app_server_sg" {
  name		= "app_server_sg"
  description	= "Security group for the app server"
  
  ingress {
    description		= "Allowed incoming connections"
    from_port		= 1
    to_port		= 65535
    cidr_blocks	 	= ["$placeholder_for_cidr_block"]
    protocol		= "tcp"
  }
}

resource "aws_s3_bucket" "app_server_bucket" {
  bucket		= "my-app-server-bucket"
  acl			= "private"

  tags = {
    Name		= "App Server Bucket"
    Environment		= "Dev"
  }
}  

