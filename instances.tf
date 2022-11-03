
resource "aws_instance" "dev" {
    count = 3 
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = "file_key"
    tags = {
      "Name" = "dev${count.index}" 
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-dev.id }"] 
    
}

resource "aws_instance" "dev4" {
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = "file_key"
    tags = {
      "Name" = "dev4" 
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-dev.id }"]
    depends_on = [aws_s3_bucket.dev4] 
}

resource "aws_instance" "dev5" {
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = "file_key"
    tags = {
      "Name" = var.key_name
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-dev.id }"] 
}

resource "aws_instance" "dev6" {
    provider = aws.us-east-2
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = "file_key"
    tags = {
      "Name" = var.key_name
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-dev-us-e2.id }"] 
}

