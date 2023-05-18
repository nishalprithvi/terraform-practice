Here I am going to create an AWS infrastructure using Terraform

Steps going to be followed for this infrastructure creation - 

1. creating key pair for access and connecting all the resources to each other
2. creating VPC
3. creating Internet Gateway
4. creating custom route table
5. creating a subnet
6. Associate subnet with Route table 
7. Create security group to allow port 22,80,443
8. create a network interface with an ip in the subnet that was created inthe step 5
9. Assign an elastic IP to the network interface created in step 8
9. create Ubuntu server and install/enable apache2
