variable "os"{
  type = string
  default = "ami-024xxxxxxx"
  description = "This is my ami-id"
}

variable "size" {
  default = "t2.micro"
}

variable "name" {
  default = "TerraformEc2"
}