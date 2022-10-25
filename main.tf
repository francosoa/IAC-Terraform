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

resource "aws_instance" "app_server" {
    ami = "ami-83065c"
    instance_type = "t2.micro"
    tags = {
      "Name" = "MyFirstInstance"
    }
    key_name = "file.pem"
}
