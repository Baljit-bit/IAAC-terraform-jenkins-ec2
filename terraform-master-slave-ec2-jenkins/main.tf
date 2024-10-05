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
  region = var.region
}

resource "aws_security_group" "sg_terraform" {
    vpc_id = "vpc-00669716a637583f3"  # Existing VPC ID
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (can be restricted)
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP
    }
    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP for your application
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]  # Allow all outgoing traffic
    }
    
    tags = {
      Name = "sg_terraform"
    }
}

resource "aws_instance" "master_app_server" {
  ami                    = var.master_amiID
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_terraform.id]
  subnet_id              = var.subnet1_id
  key_name               = var.key_name
  user_data              = file("install_jenkinmaster.sh")
  tags = {
    Name = "TerraformMasterJenkins"
  }
}

resource "aws_instance" "slave_app_server" {
  ami                    = var.slave_amiID
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.ec2sgidslave]
  subnet_id              = var.subnet1_id
  key_name               = var.key_name
  user_data              = file("install_jenkinslave.sh")
  tags = {
    Name = "TerraformSlaveJenkins"
  }
}

