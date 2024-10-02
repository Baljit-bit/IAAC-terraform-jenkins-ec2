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

resource "aws_instance" "master_app_server" {
  ami                    = var.master_amiID
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.ec2sgid]

  tags = {
    Name = "TerraformJenkinsMaster"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install epel -y
              sudo yum install -y jenkins
              sudo systemctl start jenkins
              sudo systemctl enable jenkins
              EOF
}

resource "aws_instance" "slave_app_server" {
  ami                    = var.slave_amiID
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.ec2sgid]

  tags = {
    Name = "TerraformJenkinsSlave"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install epel -y
              sudo yum install -y java-1.8.0-openjdk
              EOF
}

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}
