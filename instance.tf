provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "pUbuntu" {
  ami                    = "ami-04505e74c0741db8d"
  instance_type          = "t3.micro"
  key_name               = "key"
  vpc_security_group_ids = [aws_security_group.webserv.id]
  user_data              = file("s-data.sh")
}


resource "aws_security_group" "webserv" {
  name        = "WebServer-SG"
  description = "MySG"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
