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
    private_key = file("./id_rsa") # id_rsa must be present in same dir which have 600 permission
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

  provisioner "local-exec" {
    content     = destroy
    command = "echo 'at delete'"
  }
  provisioner "remote-exec" {
    inline = [
      "echo "hellow TF world" > /tmp/text.txt"
      ]
  }
 provisioner "local-exec" {
    script     = "./apache.sh"
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
# 22 port must for every instance for ssh access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
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
