##################################################################################
# CONFIGURATION - added for Terraform 0.14
##################################################################################


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

##################################################################################
# PROVIDERS
##################################################################################



provider "aws" {
  profile = "myprofile1"
  region  = var.region
}


##################################################################################
# RESOURCES
##################################################################################




resource "aws_instance" "windows" {
  
  ami           = "ami-00cefd54ba36fdf42"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "winkey"
  vpc_security_group_ids = ["sg-23847238474f"]
  subnet_id     = "subnet-2348273423"

  tags = {
    Name = var.instance_names

} 

}



##################################################################################
# OUTPUT
##################################################################################

output "aws_instance_public_dns" {
  value = aws_instance.windows.public_dns
}

