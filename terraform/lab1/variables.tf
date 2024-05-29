variable "region" {
  type = string
}
variable "vpc_cidr" {
  type        = string
}
variable "vpc_name" {
  type        = string
}
variable "ami" {
  type = string
}
variable "private_subnets" {
  type = map(any)
}
variable "public_subnet_cidrs" {
  type = string
}
variable "public_subnet_azs" {
  type = string
}
data "aws_instances" "name" {
}

variable "instance_type" {
  type = string
}

variable "sg" {
  type = map(any)
}


variable "allocated_storage" {
  type        = number
}

variable "engine" {
  type        = string
}

variable "engine_version" {
  type        = string
}

variable "instance_class" {
  type        = string
}

variable "db_name" {
  type        = string
}

variable "db_username" {
  type        = string
}

variable "db_password" {
  type        = string
}

variable "parameter_group_name" {
  type        = string
}

variable "skip_final_snapshot" {
  type        = bool
}
variable "db_instance_name" {
  type        = string  
}
