###################
#EC2 Instances
##################
module "ec2-public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"                                #version = "3.5.0"
  
  name = "Bastion-Host"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               =  var.key_name
  vpc_security_group_ids = [module.security-group.this_security_group_id]
  subnet_id              =  module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
