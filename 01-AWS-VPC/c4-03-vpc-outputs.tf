###################
#VPC Outputs Values
###################
output "azs" {
  description  =  "AZ in which Infrastructure in provisoned"
  value        =  module.vpc.azs
}

output "vpc_id" {
   description   =  "ID of the VPC"
   value         =   module.vpc.vpc_id
}

output "vpc_cidr_block" {
   description   =  "Cidr Block"
   value         =   module.vpc.vpc_cidr_block
}

output "private_subents" {
    description  =  "List of ID's of private subnets"
    value        =   module.vpc.private_subnets
}

output "public_subents" {
    description  =  "List of ID's of public subnets"
    value        =   module.vpc.public_subnets
}

output "nat_public_ips"  {
    description  = "List of public Elastic IP's created for AWS Nat Gateway"
    value        =  module.vpc.nat_public_ips
}
