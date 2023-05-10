# this a variable configuration file used to define the vaariables that will be used in main terraform script

variable "filename" {
    default = "/home/prithvi/terraform-practice/practice_2/pets.txt"
}

variable "content" {
    default = "I love my pet!!"
}

variable "prefix" {
    default = "Mr"
}

variable "separator" {
    default = "."
}

variable "length" {
    default = "1"
}