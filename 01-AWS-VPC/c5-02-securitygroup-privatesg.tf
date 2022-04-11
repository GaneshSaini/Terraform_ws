#######################################
#SecurityGroup for Private Instances
########################################

module "private-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version =  "3.18.0"
  
  name         =  "private-instance-sg"
  description  =  "SG for instances running in the Private Subnet"
  vpc_id       =   module.vpc.vpc_id
 
  #Ingress Rule: Allow ssh traffic only
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  #ingress_rules       = ["all-all"]

  #Egress Rule: Allow for all-all
  egress_rules        = ["all-all"]

  tags = {
    Name =  "my-private-sg"

 }
}
