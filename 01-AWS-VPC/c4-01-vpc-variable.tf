###########################
#Terraform Generic Variable
############################
variable "aws_region" {
   description  =  "Region in  which our 3 Tier AWS VPC with NAT Gateways  going to provisoned using Terraform"
   type         =   string 
   default      =   "ap-south-1"
}
/*
variable  "vpc_module_version"  {
   description  =  "Version of the VPC Module"
   type         =  float
   default      =  3.14.0 
}
*/

variable "vpc_name"  {
   description  =  "Name of the VPC"
   type         =   string
   default      =   "my-vpc"
}

variable   "vpc_cidr_block" {
   description  =  "cidr-block for VPC"
   type         =   string
   default      =   "10.0.0.0/16"
}

variable "vpc_private_subnets" {
   description  =   "IP Address range of Public Subnet"
   type         =    list(string)
   default      =    ["10.0.1.0/24", "10.0.2.0/24"]
}

variable  "vpc_public_subnets" {
   description  =   "IP Address range of Private Subnets"
   type         =    list(string)
   default      =    ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_database_subnets" {
   description  =   "IP  Address range of DataBase Subnets"
   type         =    list(string )
   default      =    ["10.0.151.0/24", "10.0.152.0/24"] 
}
variable "vpc_create_database_subnet_group" {
   description  =  "DataBase Subnet  Group"
   type         =   bool
   default      =   true
}
variable "vpc_create_database_subnet_route_table" {
   description  =  "DataBase Subnet Route Table"
   type         =   bool
   default      =   true
}
variable  "vpc_enable_nat_gateway" {
   description  =  "Enable Nat Gateway"
   type         =   bool
   default      =   true
}
variable  "vpc_single_nat_gateway" {
   description  =  "Single Nat Gateway"
   type         =   bool
   default      =   true
}
