# provider "aws" {
#   region = "us-east-1"
# }

# variable "instance_type" {
#   description = "Instance type"
#   default     = "t2.micro"
# }

# resource "aws_instance" "web" {
#   ami                    = "ami-00beae93a2d981137"
#   instance_type          = var.instance_type
#   key_name               = "shan-verginia"
#   vpc_security_group_ids = [aws_security_group.allow_http.id]
# }

# resource "aws_security_group" "allow_http" {
#   name        = "allow_http_port"
#   description = "Allow HTTP inbound traffic"
#   vpc_id      = "vpc-03e1d2655a1d23f73" # Replace with your VPC ID

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }