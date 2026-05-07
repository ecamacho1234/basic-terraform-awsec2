variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "vpc_sg_ids" {
  type = list(string)
}
variable "name" {}