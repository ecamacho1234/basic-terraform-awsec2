variable "cidr_block" {}
variable "name" {}
variable "public_subnet" {}
variable "public_subnet_name" {}
variable "private_subnet" {
  description = "CIDR private subnet"
  type = string
}
variable "private_subnet_name" {}
variable "igw_name" {}
variable "cidr_route_table" {}
variable "public_crt_name" {}