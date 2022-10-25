terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">=1.2.0"

}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
  profile = "default"
}

#define components of my infra
resource "aws_instance" "dev" {
    count = 3 #generate 3 instances
    ami = "ami-83065c"
    instance_type = "t2.micro"
    key_name = "file_key"
    tags = {
      "Name" = "dev${count.index}" #change the name of files(1,2,3)
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-dev.id }"] 
    #id of Security Group in AWS. Get the value of a variable
}

#This instance will a dependecy of a bucket variable
resource "aws_instance" "dev4" {
    ami = "ami-83065c"
    instance_type = "t2.micro"
    key_name = "file_key"
    tags = {
      "Name" = "dev4" 
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-dev.id }"]
    #id of Security Group in AWS. Get the value of a variable
    depends_on = [aws_s3_bucket.dev4] #The dependecy 
}

resource "aws_instance" "dev5" {
    ami = "ami-83065c"
    instance_type = "t2.micro"
    key_name = "file_key"
    tags = {
      "Name" = "dev5" 
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-dev.id }"] 
    #id of Security Group in AWS. Get the value of a variable
}


#Bucket S3
resource "aws_s3_bucket" "dev4" {
  bucket = "dev-environment"
  acl = "private" #Bucket permission

  tags = {
    Name        = "dev-environment"
    Environment = "Dev"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "acesso-dev" {
  name        = "acesso-dev"
  description = "Allow acesso-dev"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["45.191.13"] #several IPs
  }

  tags = {
    Name = "dev-acess"
  }
}
