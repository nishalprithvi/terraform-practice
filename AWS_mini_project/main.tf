# This infrastructure will be build in ap-northeast-1 (Tokyo) region

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
# $ export AWS_REGION="ap-northeast-1"
# $ terraform init 
# $ terraform plan (using this we check whether the authentication is done properly or not)
}

# 2.Create a VPC 

resource "aws_vpc" "prod-vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "production"
  }
}

# 3.Create Internet Gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.prod-vpc.id

}

# 4.Create custom Route Table


resource "aws_route_table" "prod-route-table" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Prod"
  }
}

# 5.Create a Subnet 

resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-1a"

    tags = {
      Name = "prod-subnet"
    }
  
}

# 6.Associate subnet with Route Table

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.prod-route-table.id
}

# 7.Create Security Group to allow port 22, 80,443

resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_web"
  }
}
# 8.Create a network interface with an ip in the subnet that was created inthe step 5 

  resource "aws_network_interface" "web-server-nic" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_web.id]

  
}

# 9.Assign an elastic IP to the network interface created in step 8

resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.web-server-nic.id
  associate_with_private_ip = "10.0.1.50"

  depends_on = [aws_internet_gateway.gw]
}

# 10.create Ubuntu server and install/enable apache2

resource "aws_instance" "web-server-instance" {
  ami = "ami-0d979355d03fa2522"
  instance_type = "t2.micro"
  availability_zone = "ap-northeast-1a"
  key_name = "terraform-key"

  network_interface{
    device_index = 0
    network_interface_id = aws_network_interface.web-server-nic.id
  }

  user_data  = <<-EOF
               #!/bin/bash
               sudo apt update -y
               sudo apt install apache2 -y
               sudo systemctl start apache2
               sudo bash -c 'echo your very first web server > /var/www/html/index.html'
               EOF
  tags = {
    Name = "web-server"
  }
}

