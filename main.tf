#Learning HCL 

/*this
is
a multiline 
comment */

#================================================================================================#

#Block
# block_type {
#     attribute1 = value1
#     attribute2 = value2
# }

# #attributes
# #key-value

# key = value 

#================================================================================================#

#Terraform code to create an instance

# resource "aws_instance" "example" {
#   ami = "ami-0c94855ba95c71c99"
#   instance_type = "t2-micro"
#   count = 2
  
# }


#================================================================================================#

//Datatypes
# string
# number
# boolean

#================================================================================================#

//List

# list=["item","item1","item2"]
# security_groups = ["sg-2132","sg-12123"]

#================================================================================================#

//maps

# variable "example_map" {
#   type = map 
#   default = {key1 = "value1", key2 = "value2", key3 = "value3"}
# }

# locals {
#   my_map = {
#     "name" = "John Doe",
#     "age" = "30"
#     "is_admin" = true
#   }
# }

# locals.my_map["name"]


#================================================================================================#

//Conditions

# resource "aws_instance" "server" {
#   instance_type = var.environment == "development" ? "t2.micro" : "t2.small"

# }

#================================================================================================#

//Functions

# locals {
#   name = "John Cena"
#   fruits = ["Apple","Orange","Banana"]
#   message = "Hello ${upper(local.name)} ! I know you like ${join("," , local.fruits)}"
# }

#================================================================================================#

//Resource dependency- used to create relationship b/w 2 diff resource. 2 types are there
// 1. implicit dependency- which is done automatically by terraform 
//2. explicit dependency

// eg:   

# resource "aws_instance" "name" {
#   vpc_security_group_ids = aws_security_group.mysg.id
  
# }

# resource "aws_security_group" "mysg" {
#    #inbound rules
# }




#================================================================================================#

//TASK-1- CREATE EC2 INSTANCE USING TERRAFORM

# provider "aws" {
#   region =  "us-east-1"

# }

# resource "aws_instance" "name" {
#   ami = "ami-006ddd9080090" //you can copy from aws console for the particular os
#   instance_type = "t2.micro"
#   tags = {
#     "Name" : "Ec2Instance1"

#   }
# }

//now type terraform init, terraform validate, terraform plan, terraform apply respectively
// now the instance will be created
//to delete this, #terraform destroy

//TERRAFORM VARIABLES
//1.Local variables
//2.Input variables
//3.output variables


//1. INPUT VARIABLES SAMPLE CODE:

# provider "aws" {
#   region = "us-east-1"

# }

# resource "aws_instance" "web" {
#   ami= var.os
#   instance_type = var.size
#   tags= {
#     Name= var.name
#   }
# }

# variable "os"{
#   type = string
#   default = "ami-024xxxxxxx"
#   description = "This is my ami-id"
# }

# variable "size" {
#   default = "t2.micro"
# }

# variable "name" {
#   default = "TerraformEc2"
# }

//2 Local variables

//eg:

# locals {
#     ami= "ami-xxxxxxxxx"
#     type= "t2.micro"
#     tags= {
#     Name= "myvm"
#     }
# }

# resource "aws_instanes" "name" {
#     ami= local.ami
#     instance_type= local.type
#     tags = tags.Name
  
# }