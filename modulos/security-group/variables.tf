variable "name" {}
variable "vpc_id" {}
variable "port" {}
variable "cidr" {
  type = list(string)
}