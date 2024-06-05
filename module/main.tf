provider "aws" {
  region = "us-east-1"
  access_key = "KIAR5N5RCH7FOABEYXE"
  secret_key = "KXiZre+YI79Ed6NJrQjtsDozEpYIeuQle26N0Vtm"
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
  source                        = "./ec2_instance"
  my_aws_instance_ami           = "ami-00beae93a2d981137"
  my_aws_instance_type          = "t2.micro"
  my_aws_instance_key_name          = "shan-verginia"
  my_aws_instance_availability_zone = "us-east-1a"
  my_aws_instance_volume_size       = 8
  my_aws_instance_count             = 2
  my_aws_instance_user_data_base64  = true
  my_aws_instance_tags              = "Terraform_instance"
  my_aws_instance_subnet            = "${module.vpc.id}"
  my_sg_vpc_id                      = "${module.vpc.id}"
  //my_aws_vpc_id = module.aws_vpc.aws_vpc_id
  //my_aws_instance_subnet = module.aws_vpc.aws_subnet_this_public
}
