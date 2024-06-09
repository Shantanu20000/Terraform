provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source                          = "./vpc"
  my_vpc_cidr_block               = "192.168.0.0/20"
  my_vpc_tags                     = "my_vpc"
  my_subnet_pub_map_ip            = true
  my_subnet_private_map_ip        = false
  my_subnet_pub_tags              = "public_subnet"
  my_subnet_pub_cidr_block        = "192.168.0.0/24"
  my_subnet_private1_tags         = "privet_subnet1"
  my_subnet_private1_cidr_block   = "192.168.1.0/24"
  my_subnet_private2_tags         = "privet_subnet2"
  my_subnet_private2_cidr_block   = "192.168.2.0/24"
  my_igw_tags                     = "igw"
  my_def_Route_example_cidr_block = "0.0.0.0/0"
  my_def_Route_example_tag        = "default"
}

module "ec2" {
  source                            = "./ec2_instance"
  my_aws_instance_ami               = "ami-00beae93a2d981137"
  my_aws_instance_type              = "t2.micro"
  my_aws_instance_key_name          = "shan_ver_key"
  my_aws_instance_availability_zone = "us-east-1a"
  my_aws_instance_volume_size       = 8
  my_aws_instance_count             = 2
  my_aws_instance_user_data_base64  = true
  my_aws_instance_tags              = "Terraform_instance"
  my_vpc_id                         = module.vpc.vpc_id
  my_subnet_id                      = module.vpc.subnet_id
  my_security_group_id              = module.vpc.security_group_id
  //my_aws_vpc_id = module.aws_vpc.aws_vpc_id
  //my_aws_instance_subnet = module.aws_vpc.aws_subnet_this_public
}

module "alb" {
  source = "./loadbalancer"
  my_lb_name                        = "terraform_lb"  
  my_vpc_id                         = module.vpc.vpc_id
  my_subnet_id                      = module.vpc.subnet_id
  my_protocol                       = "HTTP"
  my_target_group_name              = "terraform_tg"
  my_security_group_id              = module.vpc.security_group_id
  my_instance_id                    = module.ec2.instance_id
//security_group_ids = module.Terraform_sg.Terraform_sg.id
//Terraform_sg = module.Terraform_sg.Terraform_sg
//Replace with your security group IDs
}


