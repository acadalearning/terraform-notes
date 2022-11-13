#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start
sudo echo '<h1>Welcome to ACADA Learning</h1>' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to ACADA Learning</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html


#Note we are using a file function to attach it to the instance while creating it.
#boottrap the script while creating it.


1. Create a file called app-install.sh and paste the bash script
2. Create a file called provider.tf and paste the provider:
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  #profile "default"
}
3. 
==============================================================
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  #profile "default"
}

resource "aws_instance" "my_demo_ec2" {
  ami           = "ami-005de95e8ff495156" # us-east-1
  instance_type = "t2.micro"
  user_data = file("${path.module}/app1-install.sh")

  tags = {
    "Name" = "EC2 Demo"
  }
}
