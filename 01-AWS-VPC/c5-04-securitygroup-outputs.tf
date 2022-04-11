##################################
#Output Values
##################################
output "public_bastion_security_group_id"  {
   description  =  "Security Group  ID"
   value        =   module.security-group.this_security_group_id 
}

output "this_vpc_id"  {
   description  =  "VPC  ID"
   value        =    module.security-group.this_security_group_vpc_id

}

output "this_vpc_id-1"  {
   description  =  "VPC  ID"
   value        =    module.private-sg.this_security_group_vpc_id

}

output "private-sg"  {
   description  =  "SG ID"
   value        =   module.private-sg.this_security_group_id
}

output "public_bastion_security_group_name"  {
   description  =  "Security Group  Name"
   value        =   module.security-group.this_security_group_name
}

output "private-sg-1"  {
   description  =  "SG name"
   value        =   module.private-sg.this_security_group_name
}

