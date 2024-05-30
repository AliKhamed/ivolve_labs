variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "vpc_id" {
    type = string
}
variable "public_subnet_ids" {
  type = string
}
variable "sg" {
  type = map(any)
}
