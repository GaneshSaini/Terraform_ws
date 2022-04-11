#################
#Elastic IP
#################
resource "aws_eip" "bastion_ip" {
  depends_on  = [module.ec2-public, module.vpc]
  instance    =  module.ec2-public.id[0]
  vpc         = true
  tags = {
    Name =  "Elastic-IP"
  }
}
