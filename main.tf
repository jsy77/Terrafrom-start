provider "aws" {
  region = "ap-south-1"
}

# Get the Default VPC
data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "terraform_sg" {

  name        = "terraform-sg"
  description = "Created by Terraform"
  vpc_id      = data.aws_vpc.default.id

  ingress {

    description = "SSH"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    description = "HTTP"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {

    Name = "terraform-security-group"

  }

}