resource "aws_instance" "my_aws_instance" {
  ami                    = var.my_aws_instance_ami
  instance_type          = var.my_aws_instance_type
  key_name               = var.my_aws_instance_key_name
  vpc_security_group_ids = [var.my_security_group_id]
  //[var.this_aws_instance_sg_id]
  availability_zone = var.my_aws_instance_availability_zone
  subnet_id         = var.my_aws_instance_subnet
  
  root_block_device {
    volume_size = var.my_aws_instance_volume_size
  }
  count = var.my_aws_instance_count
  //user_data_base64 = var.this_aws_instance_user_data_base64
  user_data = <<-EOF
            #!/bin/bash
    sudo -i
    yum update -y
    yum install nginx -y
    echo "hello Terraform User" > /usr/share/nginx/html/index.html
    systemctl start nginx
    EOF 

  tags = {

    Name = var.my_aws_instance_tags
  }
}

