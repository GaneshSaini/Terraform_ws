##################
#Null Provisioner
##################
resource "null_resource" "name" {
    depends_on =  [module.ec2-public]
#Connection Block to connecting to the Instance
    connection {
    type     = "ssh"
    host     =  aws_eip.bastion_ip.public_ip
    user     =  "ec2-user"
    password = ""
    private_key  =  file("aws-key")
    
  }
   
   # Copies the  file to /tmp/ directory
   provisioner "file" {
     source      = "aws-key"
     destination = "/tmp/aws-key"
  }
  
   provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/aws-key"
    ]
  }

   provisioner "local-exec" {
    #command = "echo ${self.private_ip} >> private_ips.txt",
    command = "echo Infra created on `date` and VPC-ID: ${module.vpc.vpc_id}  >> vpc-creation.txt"
    #on_failure = true
    #when  =  destroy
  }
  
}
