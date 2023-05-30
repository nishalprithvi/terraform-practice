variable "inbound_port_production_ec2" {
  type        = list(any)
  default     = [22, 80]
  description = "inbound port allow on production instance"
}

variable "db_name" {
  type    = string
  default = "wordpressdb"
}

variable "db_user" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type    = string
  default = "Wordpress-AWS2Tier"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-03dceaabddff8067e" # ami for amazon linux ec2 (ap-northeast-1 region)
}

variable "key_name" {
  type    = string
  default = "terraform-key" # key pair
}

variable "availability_zone" {
  type    = list(string)
  default = ["ap-northeast-1a", "ap-northeast1b", "ap-northeast-1c"]
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16" # here we have alloted 2^16 ip addresses to the vpc
}

variable "subnet_cidrs" {
  type        = list(string)
  description = "list of all cidr for subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]   # each subnet have a range of 2^8 ip addresses
}

variable "target_application_port" {
  type    = string
  default = "80"
}