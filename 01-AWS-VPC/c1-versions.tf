############################
#Terraform Settings Block
############################
terraform {
  required_version  =  "~> 1.1"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }

    null = {
      source = "hashicorp/null"       #for null provisioner
      version = "~> 3.0"
    }
  }
}

#########################
#Terraform Provider Block
##########################
provider  "aws"  {

    region  =   "${local.aws_region}"
     profile = default
 }

locals  {
   aws_region  = "${var.aws_region}"
}
