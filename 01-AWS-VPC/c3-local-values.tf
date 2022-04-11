# Define local values in Terraform
locals {
  owners = var.business_unit
  environment = var.environment
#   name = "${var.business_unit}-${var.environment}"
  name = "${local.environment}"
  common_tags = {
      Owner = local.owners
      Environment = local.environment
  }
  multiple_app_instances = {
    one = {
      subnet_id              = module.vpc.private_subnets[0]
    }
    two = {
      subnet_id              = module.vpc.private_subnets[1]    
    }
  }
}
