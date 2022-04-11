############################
# EC2 Input Variables
############################

variable "instance_type" {
   description   =  "Type of hardware we are using"
   type          =    string
   default       =   "t2.micro"
}

variable  "key_name" {
   description  =  "Key to login inside the Instance after post provision"
   type         =   string
   default      =   "aws-key"
}

variable "private_instance_count" {
    description  =  "Number of Instances"
    type         =   number
    default      =   1
}
