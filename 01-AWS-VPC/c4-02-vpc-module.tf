##################################
#Terraform VPC Configuration
##################################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version =  "3.14.0"

#Basic Information of VPC
  name    =  var.vpc_name
  cidr    =  var.vpc_cidr_block
  azs     =  ["${local.aws_region}a", "${local.aws_region}b"]
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  #DataBase Subnets
  create_database_subnet_group  = var.vpc_create_database_subnet_group
  create_database_subnet_route_table  = var.vpc_create_database_subnet_route_table
  
  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true

  database_subnets    =  var.vpc_database_subnets

  #NAT Gateways- Outbound Communication
  enable_nat_gateway  =  var.vpc_enable_nat_gateway
  single_nat_gateway  =  var.vpc_single_nat_gateway
  
  #VPC DNS Hostname 

  enable_dns_hostnames =  true
  enable_dns_support   = true
  
  public_subnet_tags =  {
     Type   =  "public-subnets"
  }
  private_subnet_tags =  {
     Type   = "private-subnets"
  }
  database_subnet_tags =  {
     Type   =  "database-subnets"
  }
  
  tags = {
   Owner  =  "Ganesh"
   Environement  =  "Dev"
  }

  vpc_tags =  {
   Name =  "vpc-dev"
 }
}
