Here when the main.tf and variables.tf get executed pets.txt resouce and a random resource is created.
main.tf is the main terraform script used for resource creation and variable.tf is used here to declare and create variables that 
are being used and reffered by the main.tf while resource creation.

*NOTE - after cloning this repository and trying to create the resource using main.tf and variable.tf the resource wouldn't be created as here in the repository I have 
already uploaded the resource created, so to run the terraform scripts and see the resource creation we need to delete all the files except the .tf configuration files 
and start with terraform init then terraform apply.*

*OR first run terraform destory(to destroy all the resources created) and then run terraform apply for creating resources again*
