variable "my_vpc_cidr_block" {
     type = string
}
variable "my_vpc_tags" {
     type = string
}
variable "my_subnet_pub_cidr_block" {
     type = string
}

variable "my_subnet_pub_map_ip" {
    type = bool
}
variable "my_subnet_pub_tags" {
    type = string
}
variable "my_subnet_private1_cidr_block" {
    type = string
}
variable "my_subnet_private_map_ip" {
    type = bool
}

variable "my_subnet_private1_tags" {
    type = string
} 

variable "my_subnet_private2_cidr_block" {
   type = string
}

variable "my_subnet_private2_tags" {
    type = string
} 
variable "my_igw_tags" {
    type = string
} 

variable "my_def_Route_example_cidr_block" {
   type = string
}
variable "my_def_Route_example_tag" {
   type = string
}
