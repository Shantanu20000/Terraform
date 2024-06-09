variable "my_lb_name" {
  description = "Name of the ALB"
  type        = string
}

variable "my_vpc_id" {
    type = string
 }

variable "my_subnet_id" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "my_security_group_id" {
  description = "List of security group IDs for the ALB"
  type        = list(string)  
}

variable "my_target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "my_protocol" {
    type = string
}

variable "my_instance_id" {
  type = string
}

variable "instance_count" {
  description = "The number of EC2 instances to create"
  default     = 2
}
