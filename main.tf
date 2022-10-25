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
}
