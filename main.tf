terraform {
  backend "s3" {
    bucket = "samarth-yadav"
    key    = "tf-file-upload/terraform.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_security_group" "ec2_sg" {
  description = "public-client-sg"
  vpc_id      = var.vpc_id
  name        = var.sg_name

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name               = var.sg_name
    ResourceAttachedto = "nothing"
    usedfor            = var.usedfor
  }

}