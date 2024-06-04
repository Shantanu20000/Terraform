variable "my_aws_instance_ami" {
     type = string
}

variable "my_aws_instance_instance_type" {
    type = string
}
variable "my_aws_instance_key_name" {
    type = string
}
variable "my_aws_instance_availability_zone" {
    type = string
}
variable "my_aws_instance_volume_size" {
    type = number
}

variable "my_aws_instance_count" {
    type = number
} 
variable "my_aws_instance_user_data_base64" {
    type = bool
} 
variable "my_aws_instance_tags" {
    type = string
} 
variable "my_aws_instance_subnet" {
    type = string
} 
variable "my_sg_vpc_id" {
    type = string
}   