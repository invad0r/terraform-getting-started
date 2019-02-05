variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
# lookup-table; used via "${lookup(var.amis, var.region)}"
variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}

