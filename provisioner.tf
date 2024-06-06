connection {
  type = "ssh"
  user = "ec2-user"
  private_key = file("${path.module}/id.rsa") # id_rsa is present in same dir in which we command "terraform apply" is apply.
  host = "${self.public_ip}"
  }
provisioner "file" {
  source = "readme.md" # terraform machine
  destination = "/tmp/readme.md" # remote machine
  }
provisioner "file" {
  content = "this is Terraform User" # terraform machine
  destination = "/tmp/terraform" # remote machine
  }
