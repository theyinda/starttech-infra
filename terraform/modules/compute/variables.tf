variable "project_name" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "public_subnet_ids" {
  type = list(string)
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "instance_type" {
  type = string
}
variable "key_pair_name" {
  type = string
}
variable "my_ip_address" {
  type = string
}
variable "mongo_uri" {
  type      = string
  sensitive = true
}
variable "jwt_secret" {
  type      = string
  sensitive = true
}
variable "aws_region" {
  type = string
}
