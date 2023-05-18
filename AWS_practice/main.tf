terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}


# CONFIGURING THE AWS PROVIDER
provider "aws"{

# one of the way for authenticating aws with terraform is to pass access key as environment variables
# use the below commands and run them in your linux terminal to complete the aws and terraform authentication 

# $ export AWS_ACCESS_KEY_ID="anaccesskey"
# $ export AWS_SECRET_ACCESS_KEY="asecretkey"
# $ export AWS_REGION="us-east-1"
# $ terraform init 
# $ terraform plan (using this we check whether the authentication is done properly or not)
}

# RESOURCE BLOCK FOR CREATING A EC2 INSTANCE

#resource "aws_instance" "terraform_one" {
    
    # all these resources are being created in us-east-1 region (virginia)
  
#  ami           = "ami-0889a44b331db0194" # check ami ID concisely as ami ID vary region to region
#  instance_type = "t2.micro"

#  tags = {
#    Name = "terraform_one_creation"
#  }
#}


# CREATING A VPC(Virtual Private Cloud) REFRENCING IT FOR THE CREATION OF SUBNET
# CREATING ALL THESE RESOURCES IN REGION  - "ap-northeast-1"(TOKYO)

#resource "aws_vpc" "vpc_one" {
#  cidr_block = "10.0.0.0/16"
#
#  tags = {
#    Name = "vpc_one"
#  }
#}

#resource "aws_subnet" "subnet_one" {
#  vpc_id     = aws_vpc.vpc_one.id  # HERE VPC IS BEING REFERENCED
#  cidr_block = "10.0.1.0/24"
#
#  tags = {
#    Name = "subnet_one"
#  }
#}


