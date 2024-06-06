provider "aws" {
  region = "us-east-1"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

resource "aws_instance" "web" {
  ami                    = "ami-00beae93a2d981137"
  instance_type          = var.instance_type
  key_name               = "shan_ver_key" #replace your key
  vpc_security_group_ids = [aws_security_group.allow_http.id]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/id_rsa") # Corrected from 'id.rsa' to 'id_rsa'
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "readme.md"
    destination = "/tmp/readme.md"
  }

  provisioner "file" {
    content     = "this is Terraform User"
    destination = "/tmp/terraform"
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http_port"
  description = "Allow HTTP inbound traffic"
  vpc_id      = "vpc-03cac74c80618b66d" # Replace with your VPC ID

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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
