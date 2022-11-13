terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = var.my_region
  #profile = "default"
}

module "ec2module" {
  source = "./ec2"
  ec2name = "Demo-ec2"
}

output "module_output" {
  value = module.ec2module.instance_id
}