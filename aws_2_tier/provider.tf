# use the below commands and run them in your linux terminal to complete the aws and terraform authentication 

# $ export AWS_ACCESS_KEY_ID="anaccesskey"
# $ export AWS_SECRET_ACCESS_KEY="asecretkey"
# $ terraform init 
# $ terraform plan (using this we check whether the authentication is done properly or not)

provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.65.0"
    }
  }
}