
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "acesso-dev" {
  name        = "acesso-dev"
  description = "Allow acesso-dev"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdirblocks #several IPs
  }

  tags = {
    Name = "dev-acess"
  }
}

resource "aws_security_group" "acesso-dev-us-e2" {
  provider = aws.us-east-2
  name        = "acesso-dev"
  description = "Allow acesso-dev"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdirblocks #several IPs
  }

  tags = {
    Name = "dev-acess"
  }
}

