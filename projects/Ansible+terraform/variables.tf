variable "instance_name" {
description = "Name of the instance to be created"
default = "Test-instance"
}
variable "instance_type" {
description = "Type of instance to be created"
default = "t3.micro"
}
variable "subnet_id" {
description = "The VPC subnet the instance(s) will be created in"
default = "subnet-04ffbd669cd37a2ee"
}
variable "ami_id" {
description = "The AMI to use"
default = "ami-09a9858973b288bdd"
}
variable "number_of_instances" {
description = "Number of instances to be created"
default = 1
}
variable "ami_key_pair_name" {
description = "Key pair name for the instances"
default = "DevOps"
}
variable "region" {
    description = "region"
    default = "eu-north-1"
  
}