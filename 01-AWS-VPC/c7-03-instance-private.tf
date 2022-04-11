###########
#EC2 Instances
#############
/*module "ec2-private" {
  depends_on = [module.vpc]
  source  = "terraform-aws-modules/ec2-instance/aws" 
  version  = "2.17.0"
  name = "Private-Instance-${count.index}"
  count         =   var.private_instance_count

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               =  var.key_name
  vpc_security_group_ids = [module.security-group.this_security_group_id]

  subnet_ids             = [
      module.vpc.private_subnets[0],
      module.vpc.private_subnets[1]
  ]
  user_data              =   file("app1-install.sh")
  tags = {
    Type  =  "Public-$count.index}"
  }
}
*/

########
# AWS EC2 Instance Terraform Module
# Private Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2-private" {
  depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.1.0"

  for_each = local.multiple_app_instances

  name = "MyInstance-${each.key}-${var.environment}"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = each.value.subnet_id
  # monitoring             = true
  vpc_security_group_ids = [module.private-sg.this_security_group_id]
  # subnet_id              = module.example_vpc.public_subnets[0]

  user_data = file("${path.module}/app1-install.sh")
  tags = local.common_tags

}
