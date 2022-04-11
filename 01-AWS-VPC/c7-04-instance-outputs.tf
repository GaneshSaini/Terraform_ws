##########################
#Terraform Output Values
##########################
output "bastion_instance_id" {
   description  =  "ID of the JumpBox/Bastion-Host"
   value        =   module.ec2-public.id
}

output "private_instance_id" {
   description  =  "ID of the Private-Instances"
   value        =   [ for instance in module.ec2-private: instance.id]
}

output  "bastion-public-ip" {
   description   =  "Public IP of the Instance"
   value         =   module.ec2-public.public_ip
}

/*output "private-ip" {
   description   =  "Private IP of the Instance"
   value         =   [ for instance in module.ec2-private: instance.private_ips]
}
*/
output "key-pair" {
   description  =  "Nothing"
   value        =    aws_key_pair.MyKey.key_name
}
/*
output "private-id" {
    description  =  "ID"
    value        =  module.ec2-private[*].id
}
*/
