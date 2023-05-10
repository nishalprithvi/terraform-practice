resource "local_file"  "pet" {
    filename = "/home/prithvi/terraform-practice/practice_3/pets.txt"
    content = "My favourite pet is ${random_pet.my-pet.id}" # here we are performing resource attribute referencing
    # here we referenced the attribute id from the random resource
    # synatx for referencing resource attribute  - ${resource_type.resource_name.resource_attribute}
  
}

resource "random_pet"  "my-pet" {
    prefix = "Mr"
    separator = "."
    length = "1"
  
}