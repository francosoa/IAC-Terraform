terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">=1.2.0"

}

provider "aws" {
  region = "us-west-2"
  profile = "default"
}

provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
  profile = "default"
}

#Bucket S3
#The depedency is in learn-terraform\IAC-Terraform\instances.tf
resource "aws_s3_bucket" "dev4" {
  bucket = "dev-environment"
  acl = "private" #Bucket permission

  tags = {
    Name        = "dev-environment"
    Environment = "Dev"
  }
}
<<<<<<< Updated upstream
=======

#Create a database to instance Dev-6
resource "aws_dynamodb_table" "table-dev6" {
  provider = "aws.us-east-2"
  name = "Dynamo-Dev6"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "UserId"
  range_key = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute{
    name = "GameTitle"
    type = "S"
  }
}

>>>>>>> Stashed changes
