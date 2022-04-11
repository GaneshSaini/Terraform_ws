###### #####################################
#Provision Security group through module
############################################
module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version =   "3.18.0"
   
  name         =  "public-bastion-sg"
  description  = "SG for Bastion-Host  only port 22 allowed for ingress(IPV4 CIDR) &  for egress all ports are allowed"
  vpc_id       = module.vpc.vpc_id
   
  #Ingress Rule: Allow ssh traffic only
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]

  #Egress Rule: Allow for all-all
  egress_rules        = ["all-all"]
  
  tags = {
    Name =  "my-sg"
 }
}
