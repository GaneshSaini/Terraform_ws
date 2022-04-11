###############################################
#Security Group for Application Load Balancer
###############################################
module "loadbalancer_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  
  name    =  "loadbalancer-sg"
  description  = "SG for Application load balancer"
  vpc_id       =  module.vpc.vpc_id
  tags =  {
   Name =  "my-sg-alb"
   }
   ingress_cidr_blocks =  ["0.0.0.0/0"]
   ingress_rules      =  ["http-80-tcp", "ssh-tcp"]
   egress_rules       =  ["all-all"]
   
   #We are also making entry for port  81
   ingress_with_cidr_blocks = [
      {
        from_port   = 81
        to_port     = 81
        protocol    = 6   #Protocol number of TCP
        cidr_blocks = "0.0.0.0/0"
      }
    ]
}
     
